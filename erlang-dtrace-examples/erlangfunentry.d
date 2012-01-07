erlang*:::function-entry
{
    printf("pid %s enter  %s depth %d\n",
	   copyinstr(arg0), copyinstr(arg1), arg2);
}