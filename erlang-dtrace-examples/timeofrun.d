/* comments here!*/

/*
dtrace:::BEGIN
{
}
*/

/*
profile:::tick-1msec 
{
	i = i + 1;
	trace(i);
}
*/
syscall::read:entry,
syscall::write:entry
/pid == $1/
{
	ts[probefunc] = timestamp;
}

syscall::read:return,
syscall::write:return
/pid == $1 && ts[probefunc] != 0/
{
	printf("%d nsecs",timestamp - ts[probefunc]);
}
/*
dtrace:::END
{
	trace(i);
}
*/

