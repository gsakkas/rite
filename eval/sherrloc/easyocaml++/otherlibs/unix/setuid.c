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

/* $Id: setuid.c,v 1.8 2001/12/07 13:40:33 xleroy Exp $ */

#include <mlvalues.h>
#include "unixsupport.h"

CAMLprim value unix_setuid(value uid)
{
  if (setuid(Int_val(uid)) == -1) uerror("setuid", Nothing);
  return Val_unit;
}
