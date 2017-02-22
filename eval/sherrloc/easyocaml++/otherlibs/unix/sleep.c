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

/* $Id: sleep.c,v 1.9 2001/12/07 13:40:35 xleroy Exp $ */

#include <mlvalues.h>
#include <signals.h>
#include "unixsupport.h"

CAMLprim value unix_sleep(value t)
{
  enter_blocking_section();
  sleep(Int_val(t));
  leave_blocking_section();
  return Val_unit;
}
