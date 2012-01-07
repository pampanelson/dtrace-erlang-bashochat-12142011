#! /usr/sbin/dtrace -s

BEGIN
{
    trace("hello,world!");
    exit(0);
}