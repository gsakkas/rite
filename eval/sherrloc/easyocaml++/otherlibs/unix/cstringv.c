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

/* $Id: cstringv.c,v 1.7 2001/12/07 13:40:27 xleroy Exp $ */

#include <mlvalues.h>
#include <memory.h>
#include "unixsupport.h"

char ** cstringvect(value arg)
{
  char ** res;
  mlsize_t size, i;

  size = Wosize_val(arg);
  res = (char **) stat_alloc((size + 1) * sizeof(char *));
  for (i = 0; i < size; i++) res[i] = String_val(Field(arg, i));
  res[size] = NULL;
  return res;
}

  
