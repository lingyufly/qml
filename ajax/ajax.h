#ifndef AJAX_H
#define AJAX_H

#include <QObject>
#include <QJSValue>
#include <QVariant>

class QNetworkAccessManager;
class QNetworkReply;
class QTimer;

class QReplyTimeout : public QObject
{
    Q_OBJECT
public:
    explicit QReplyTimeout(QNetworkReply *parent,int timeout);
    virtual ~QReplyTimeout();

private:
    QTimer* mTimeoutTimer;
};


class Ajax:public QObject
{
  Q_OBJECT
public:
    explicit Ajax(QObject *parent=0);
    virtual ~Ajax();

    Q_INVOKABLE void get(QString url, QJSValue jsObj, QJSValue jsCb, QJSValue jsErr);
    Q_INVOKABLE void post(QString url, QJSValue jsObj, QJSValue jsCb, QJSValue jsErr);

    Q_INVOKABLE void test(QJSValue jsObj);

protected slots:

private:
    static QNetworkAccessManager s_qNetworkManager;
};


#endif // AJAX_H
