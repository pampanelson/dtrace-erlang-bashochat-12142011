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
	
}
/*
dtrace:::END
{
	trace(i);
}
*/

