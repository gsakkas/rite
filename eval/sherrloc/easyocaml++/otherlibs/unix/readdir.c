/***********************************************************************/
/*                                                                     */
/*                           Objective Caml                            */
/*                                                                     */
/*            Xavier Leroy, projet Cristal, INRIA Rocquencourt         */
/*                                                                     */
/*  Copyright 1996 Institut National de Recherche en Informatique et   */
/*  en Automatique.  All rights reserved.  This file is distributed    */
/*  under the terms of the GNU Library General Public License, with    */
/*  the special exception on linking described in file ../../LICENSE.  */
/*                                                                     */
/***********************************************************************/

/* $Id: readdir.c,v 1.12 2004/02/14 10:21:23 xleroy Exp $ */

#include <mlvalues.h>
#include <fail.h>
#include <alloc.h>
#include "unixsupport.h"
#include <errno.h>
#include <sys/types.h>
#ifdef HAS_DIRENT
#include <dirent.h>
typedef struct dirent directory_entry;
#else
#include <sys/dir.h>
typedef struct direct directory_entry;
#endif

CAMLprim value unix_readdir(value vd)
{
  DIR * d;
  directory_entry * e;
  d = DIR_Val(vd);
  if (d == (DIR *) NULL) unix_error(EBADF, "readdir", Nothing);
  e = readdir((DIR *) d);
  if (e == (directory_entry *) NULL) raise_end_of_file();
  return copy_string(e->d_name);
}
