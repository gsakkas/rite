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

/* $Id: sleep.c,v 1.5 2002/06/07 09:49:41 xleroy Exp $ */

#include <mlvalues.h>
#include <signals.h>
#include "unixsupport.h"

CAMLprim value unix_sleep(t)
     value t;
{
  enter_blocking_section();
  Sleep(Int_val(t) * 1000);
  leave_blocking_section();
  return Val_unit;
}
