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

/* $Id: rename.c,v 1.10 2001/12/07 13:40:33 xleroy Exp $ */

#include <stdio.h>
#include <mlvalues.h>
#include "unixsupport.h"

CAMLprim value unix_rename(value path1, value path2)
{
  if (rename(String_val(path1), String_val(path2)) == -1)
    uerror("rename", path1);
  return Val_unit;
}
