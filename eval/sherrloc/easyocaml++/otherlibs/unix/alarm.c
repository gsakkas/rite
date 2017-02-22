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

/* $Id: alarm.c,v 1.8 2005/03/24 17:20:53 doligez Exp $ */

#include <mlvalues.h>
#include "unixsupport.h"

CAMLprim value unix_alarm(value t)
{
  return Val_int(alarm((unsigned int) Long_val(t)));
}
