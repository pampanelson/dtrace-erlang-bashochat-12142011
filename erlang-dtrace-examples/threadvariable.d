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
syscall::read:entry
{
	self->t = timestamp;
}

syscall::read:return
/self->t != 0/
{
	printf("the pid: %d of tid: %d with name of %s spent %d nsecs in read/2\n",
	        pid,tid,execname,timestamp - self->t);
	
	/* * We’re done with this thread-local variable; assign zero to it to * allow the DTrace runtime to reclaim the underlying storage. */
	self->t = 0;
}
/*
dtrace:::END
{
	trace(i);
}
*/

