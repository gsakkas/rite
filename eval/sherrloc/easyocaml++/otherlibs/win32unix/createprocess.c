/***********************************************************************/
/*                                                                     */
/*                           Objective Caml                            */
/*                                                                     */
/*  Xavier Leroy and Pascal Cuoq, projet Cristal, INRIA Rocquencourt   */
/*                                                                     */
/*  Copyright 1996 Institut National de Recherche en Informatique et   */
/*  en Automatique.  All rights reserved.  This file is distributed    */
/*  under the terms of the GNU Library General Public License, with    */
/*  the special exception on linking described in file ../../LICENSE.  */
/*                                                                     */
/***********************************************************************/

/* $Id: createprocess.c,v 1.13.20.1 2007/10/25 08:32:42 xleroy Exp $ */

#include <windows.h>
#include <mlvalues.h>
#include <osdeps.h>
#include "unixsupport.h"

static int win_has_console(void);

value win_create_process_native(value cmd, value cmdline, value env,
                                value fd1, value fd2, value fd3)
{
  PROCESS_INFORMATION pi;
  STARTUPINFO si;
  char * exefile, * envp;
  int flags;

  exefile = search_exe_in_path(String_val(cmd));
  if (env != Val_int(0)) {
    envp = String_val(Field(env, 0));
  } else {
    envp = NULL;
  }
  /* Prepare stdin/stdout/stderr redirection */
  GetStartupInfo(&si);
  si.dwFlags |= STARTF_USESTDHANDLES;
  si.hStdInput = Handle_val(fd1);
  si.hStdOutput = Handle_val(fd2);
  si.hStdError = Handle_val(fd3);
  /* If we do not have a console window, then we must create one
     before running the process (keep it hidden for apparence).
     Also one must suppress spurious flags in si.dwFlags.
     Otherwise the redirections are ignored.
     If we are starting a GUI application, the newly created
     console should not matter. */
  if (win_has_console())
    flags = 0;
  else {
    flags = CREATE_NEW_CONSOLE;
    si.dwFlags = (STARTF_USESHOWWINDOW | STARTF_USESTDHANDLES);
    si.wShowWindow = SW_HIDE;
  }
  /* Create the process */
  if (! CreateProcess(exefile, String_val(cmdline), NULL, NULL,
                      TRUE, flags, envp, NULL, &si, &pi)) {
    win32_maperr(GetLastError());
    uerror("create_process", cmd);
  }
  CloseHandle(pi.hThread);
  /* Return the process handle as pseudo-PID
     (this is consistent with the wait() emulation in the MSVC C library */
  return Val_long(pi.hProcess);
}

CAMLprim value win_create_process(value * argv, int argn)
{
  return win_create_process_native(argv[0], argv[1], argv[2],
                                   argv[3], argv[4], argv[5]);
}

static int win_has_console(void)
{
  HANDLE h, log;
  int i;

  h = CreateFile("CONOUT$", GENERIC_WRITE, FILE_SHARE_WRITE, NULL,
                 OPEN_EXISTING, FILE_ATTRIBUTE_NORMAL, NULL);
  if (h == INVALID_HANDLE_VALUE) {
    return 0;
  } else {
    CloseHandle(h);
    return 1;
  }
}
