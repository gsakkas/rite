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

/* $Id: fchown.c,v 1.9 2005/03/24 17:20:53 doligez Exp $ */

#include <fail.h>
#include <mlvalues.h>
#include "unixsupport.h"

#ifdef HAS_FCHMOD

CAMLprim value unix_fchown(value fd, value uid, value gid)
{
  if (fchown(Int_val(fd), Int_val(uid), Int_val(gid)) == -1)
    uerror("fchown", Nothing);
  return Val_unit;
}

#else

CAMLprim value unix_fchown(value fd, value uid, value gid)
{ invalid_argument("fchown not implemented"); }
  
#endif
