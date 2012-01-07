/* example usage: dtrace -q -s /path/to/spawn-exit.d */
/*
 * %CopyrightBegin%
 * 
 * Copyright Scott Lystig Fritchie 2011. All Rights Reserved.
 * 
 * The contents of this file are subject to the Erlang Public License,
 * Version 1.1, (the "License"); you may not use this file except in
 * compliance with the License. You should have received a copy of the
 * Erlang Public License along with this software. If not, it can be
 * retrieved online at http://www.erlang.org/.
 * 
 * Software distributed under the License is distributed on an "AS IS"
 * basis, WITHOUT WARRANTY OF ANY KIND, either express or implied. See
 * the License for the specific language governing rights and limitations
 * under the License.
 * 
 * %CopyrightEnd%
 */

erlang*:::process-spawn
/*  track specific process by mfa */ 
/$1 == copyinstr(arg1)/
/*  track specific process by pid */ 
/* /$1 == copyinstr(arg0)/ */
{
    printf("pid %s mfa %s\n", copyinstr(arg0), copyinstr(arg1));
}

erlang*:::process-exit
/$1 == copyinstr(arg1)/
{
    printf("pid %s reason %s\n", copyinstr(arg0), copyinstr(arg1));
}

