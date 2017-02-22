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

/* $Id: fchmod.c,v 1.10 2005/03/24 17:20:53 doligez Exp $ */

#include <sys/types.h>
#include <sys/stat.h>
#include <fail.h>
#include <mlvalues.h>
#include "unixsupport.h"

#ifdef HAS_FCHMOD

CAMLprim value unix_fchmod(value fd, value perm)
{
  if (fchmod(Int_val(fd), Int_val(perm)) == -1) uerror("fchmod", Nothing);
  return Val_unit;
}

#else

CAMLprim value unix_fchmod(value fd, value perm)
{ invalid_argument("fchmod not implemented"); }
  
#endif
