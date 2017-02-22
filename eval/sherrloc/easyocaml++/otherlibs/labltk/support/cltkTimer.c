/***********************************************************************/
/*                                                                     */
/*                 MLTk, Tcl/Tk interface of Objective Caml            */
/*                                                                     */
/*    Francois Rouaix, Francois Pessaux, Jun Furuse and Pierre Weis    */
/*               projet Cristal, INRIA Rocquencourt                    */
/*            Jacques Garrigue, Kyoto University RIMS                  */
/*                                                                     */
/*  Copyright 2002 Institut National de Recherche en Informatique et   */
/*  en Automatique and Kyoto University.  All rights reserved.         */
/*  This file is distributed under the terms of the GNU Library        */
/*  General Public License, with the special exception on linking      */
/*  described in file LICENSE found in the Objective Caml source tree. */
/*                                                                     */
/***********************************************************************/

/* $Id: cltkTimer.c,v 1.9 2002/04/26 12:16:19 furuse Exp $ */

#include <tcl.h>
#include <tk.h>
#include <mlvalues.h>
#include <callback.h>
#include "camltk.h"


/* Basically the same thing as FileProc */
void TimerProc (ClientData clientdata)
{
  callback2(*handler_code,Val_long(clientdata),Val_int(0));
}

CAMLprim value camltk_add_timer(value milli, value cbid)
{
  CheckInit();
  /* look at tkEvent.c , Tk_Token is an int */ 
  return (Val_int(Tcl_CreateTimerHandler(Int_val(milli), TimerProc, 
                                       (ClientData) (Int_val(cbid)))));
}

CAMLprim value camltk_rem_timer(value token)
{
  Tcl_DeleteTimerHandler((Tcl_TimerToken) Int_val(token));
  return Val_unit;
}

