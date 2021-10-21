#include "cobject.h"

CObject::CObject(QObject *parent)
    :QObject(parent)
{

}

CObject::~CObject()
{

}

int CObject::test(int a)
{
    return ++a;
}

int CObject::add(int a, int b)
{
    return a+b;
}
