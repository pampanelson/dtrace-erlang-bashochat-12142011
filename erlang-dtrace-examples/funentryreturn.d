/*
erlang*:::function-entry
{
    printf("pid %s enter  %s depth %d\n",
	   copyinstr(arg0), copyinstr(arg1), arg2);
}

erlang*:::function-return
{
    printf("pid %s return %s depth %d\n",
	   copyinstr(arg0), copyinstr(arg1), arg2);
}
*/

erlang*:::copy-struct
{
    printf("copy_struct %d bytes\n", arg0);
}

erlang*:::copy-object
{
    printf("copy_object pid %s %d bytes\n", copyinstr(arg0), arg1);
}