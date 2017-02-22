/***********************************************************************/
/*                                                                     */
/*                           Objective Caml                            */
/*                                                                     */
/*            Xavier Leroy, projet Cristal, INRIA Rocquencourt         */
/*                                                                     */
/*  Copyright 2001 Institut National de Recherche en Informatique et   */
/*  en Automatique.  All rights reserved.  This file is distributed    */
/*  under the terms of the GNU Library General Public License, with    */
/*  the special exception on linking described in file ../LICENSE.     */
/*                                                                     */
/***********************************************************************/

/* $Id: backtrace.h,v 1.7 2007/01/29 12:11:15 xleroy Exp $ */

#ifndef CAML_BACKTRACE_H
#define CAML_BACKTRACE_H

#include "mlvalues.h"

CAMLextern int caml_backtrace_active;
CAMLextern int caml_backtrace_pos;
CAMLextern code_t * caml_backtrace_buffer;
CAMLextern value caml_backtrace_last_exn;

extern void caml_init_backtrace(void);
#ifndef NATIVE_CODE
extern void caml_stash_backtrace(value exn, code_t pc, value * sp);
#endif
CAMLextern void caml_print_exception_backtrace(void);

#endif /* CAML_BACKTRACE_H */
