/***********************************************************************/
/*                                                                     */
/*                           Objective Caml                            */
/*                                                                     */
/*            Xavier Leroy, projet Gallium, INRIA Rocquencourt         */
/*                                                                     */
/*  Copyright 2006 Institut National de Recherche en Informatique et   */
/*  en Automatique.  All rights reserved.  This file is distributed    */
/*  under the terms of the GNU Library General Public License, with    */
/*  the special exception on linking described in file ../../LICENSE.  */
/*                                                                     */
/***********************************************************************/

/* $Id: isatty.c,v 1.1 2006/09/21 13:54:26 xleroy Exp $ */

#include <mlvalues.h>
#include "unixsupport.h"

CAMLprim value unix_isatty(value fd)
{
  return (Val_bool(isatty(Int_val(fd))));
}
