/***********************************************************************/
/*                                                                     */
/*                           Objective Caml                            */
/*                                                                     */
/*            Xavier Leroy, projet Cristal, INRIA Rocquencourt         */
/*                                                                     */
/*  Copyright 1998 Institut National de Recherche en Informatique et   */
/*  en Automatique.  All rights reserved.  This file is distributed    */
/*  under the terms of the GNU Library General Public License, with    */
/*  the special exception on linking described in file ../../LICENSE.  */
/*                                                                     */
/***********************************************************************/

/* $Id: putenv.c,v 1.9 2005/03/24 17:20:53 doligez Exp $ */

#include <stdlib.h>
#include <string.h>

#include <fail.h>
#include <memory.h>
#include <mlvalues.h>

#include "unixsupport.h"

#ifdef HAS_PUTENV

CAMLprim value unix_putenv(value name, value val)
{
  mlsize_t namelen = string_length(name);
  mlsize_t vallen = string_length(val);
  char * s = (char *) stat_alloc(namelen + 1 + vallen + 1);

  memmove (s, String_val(name), namelen);
  s[namelen] = '=';
  memmove (s + namelen + 1, String_val(val), vallen);
  s[namelen + 1 + vallen] = 0;
  if (putenv(s) == -1) uerror("putenv", name);
  return Val_unit;
}

#else

CAMLprim value unix_putenv(value name, value val)
{ invalid_argument("putenv not implemented"); }

#endif
