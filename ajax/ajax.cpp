#include "ajax.h"
#include <QNetworkAccessManager>
#include <QNetworkReply>
#include <QThread>
#include <QJSEngine>
#include <QJsonObject>
#include <QVariant>
#include <QJsonDocument>
#include <QTimer>
#include <QTextCodec>

QNetworkAccessManager Ajax::s_qNetworkManager;

QReplyTimeout::QReplyTimeout(QNetworkReply *parent,int timeout) : QObject(parent)
{
    if(parent && parent->isRunning())
    {
        mTimeoutTimer = new QTimer(this);
        mTimeoutTimer->setSingleShot(true);
        connect(mTimeoutTimer, &QTimer::timeout, [=](){
            QNetworkReply *reply = parent;

            if(reply->isRunning())
            {
                reply->abort();
            }
        });
        mTimeoutTimer->start(timeout);
    }
}

QReplyTimeout::~QReplyTimeout()
{

}


Ajax::Ajax(QObject *parent)
    :QObject(parent)
{
    //m_pNetworkManager=new QNetworkAccessManager(this);
}

Ajax::~Ajax()
{

}

void Ajax::get(QString url, QJSValue jsObj, QJSValue jsCb, QJSValue jsErr)
{
    QVariant var=jsObj.toVariant();
    QJsonDocument doc = QJsonDocument::fromVariant(var);
    QJsonObject obj=doc.object();
    QStringList qList;
    for (auto it=obj.begin(); it!=obj.end(); it++)
    {
        QString ss=it.key()+"="+it.value().toVariant().toString();
        qList.append(ss);
    }
    QString getUrl=url+"?"+qList.join('&');

    QNetworkRequest request=QNetworkRequest(getUrl);
    QNetworkReply *pReply = s_qNetworkManager.get(request);
    if (pReply==nullptr)
    {
        return;
    }

    //QReplyTimeout * pTimeout = new QReplyTimeout(pReply, 3000);

    QTimer::singleShot(3000, [=]()mutable{
        if(pReply->isRunning())
        {
            pReply->abort();
        }
    });

    connect(pReply, &QNetworkReply::finished, [=]()mutable{
        QVariant statusCode = pReply->attribute(QNetworkRequest::HttpStatusCodeAttribute);
        if (statusCode.isValid() && statusCode.toInt()==200)
        {
            QJsonDocument jdoc = QJsonDocument::fromJson(pReply->readAll());
            QJSValue val = jsCb.engine()->toScriptValue(jdoc.toJson());
            QJSValueList vl;
            vl.append(val);
            jsCb.call(vl);
        }
        else
        {
            QJSValue val = jsErr.engine()->toScriptValue(pReply->errorString());
            QJSValueList vl;
            vl.append(val);
            jsErr.call(vl);
        }
        pReply->close();
        pReply->deleteLater();
    });
}

void Ajax::post(QString url, QJSValue jsObj, QJSValue jsCb, QJSValue jsErr)
{
    QNetworkRequest request=QNetworkRequest(url);
    request.setRawHeader("Content-Type","application/json");

    QVariant var=jsObj.toVariant();
    QJsonDocument doc = QJsonDocument::fromVariant(var);
    QNetworkReply *pReply = s_qNetworkManager.post(request, doc.toJson());
    if (pReply==nullptr)
    {
        return;
    }

    //QReplyTimeout * pTimeout = new QReplyTimeout(pReply, 3000);
    QTimer::singleShot(3000, [=]()mutable{
        if(pReply->isRunning())
        {
            pReply->abort();
        }
    });

    connect(pReply, &QNetworkReply::finished, [=]()mutable{
        QVariant statusCode = pReply->attribute(QNetworkRequest::HttpStatusCodeAttribute);
        if (statusCode.isValid() && statusCode.toInt()==200)
        {
            QJsonDocument jdoc = QJsonDocument::fromJson(pReply->readAll());
            QJSValue val = jsCb.engine()->toScriptValue(jdoc.toJson());
            QJSValueList vl;
            vl.append(val);
            jsCb.call(vl);
        }
        else
        {
            QJSValue val = jsErr.engine()->toScriptValue(pReply->errorString());
            QJSValueList vl;
            vl.append(val);
            jsErr.call(vl);
        }

        pReply->close();
        pReply->deleteLater();
    });
}

void Ajax::test(QJSValue jsObj)
{
    QVariant var=jsObj.toVariant();
    QJsonDocument doc = QJsonDocument::fromVariant(var);
    qDebug()<<doc.toJson();
}












