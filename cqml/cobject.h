#ifndef COBJECT_H
#define COBJECT_H


#include <QObject>

class CObject : public QObject
{
    Q_OBJECT
public:
    explicit CObject(QObject *parent=0);
    virtual ~CObject();

    Q_INVOKABLE int test(int a);

    Q_INVOKABLE int add(int a, int b);
};

#endif // COBJECT_H
