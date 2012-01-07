/* comments here!*/

dtrace:::BEGIN
{
	i = 0;
}

profile:::tick-1msec /* millisecond */
{
	i = i + 1;
	trace(i);
}

dtrace:::END
{
	trace(i);
}
