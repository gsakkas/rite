(***********************************************************************)
(*                                                                     *)
(*              LablTk, Tcl/Tk interface of Objective Caml             *)
(*                                                                     *)
(*         Jacques Garrigue, Nagoya University Mathematics Dept.       *)
(*                                                                     *)
(*  Copyright 2004 Institut National de Recherche en Informatique et   *)
(*  en Automatique and Kyoto University.  All rights reserved.         *)
(*  This file is distributed under the terms of the GNU Library        *)
(*  General Public License, with the special exception on linking      *)
(*  described in file LICENSE found in the Objective Caml source tree. *)
(*                                                                     *)
(***********************************************************************)

(* $Id: tkthread.mli,v 1.2.16.2 2007/08/05 23:53:05 garrigue Exp $ *)

(* Helper functions for using LablTk with threads.
   To use, add tkthread.cmo or tkthread.cmx to your command line *)

(** Start the main loop in a new GUI thread. Do not use recursively. *) 
val start : unit -> Thread.t
(** The actual function executed in the GUI thread *)
val thread_main : unit -> unit
(** The toplevel widget (an alias of [Widget.default_toplevel]) *)
val top : Widget.toplevel Widget.widget

(* Jobs are needed for Windows, as you cannot do GUI work from
   another thread. This is apparently true on OSX/Aqua too.
   And even using X11 some calls need to come from the main thread.
   The basic idea is to either use async (if you don't need a result)
   or sync whenever you call a Tk related function from another thread
   (for instance with the threaded toplevel).
   With sync, beware of deadlocks!
*)

(** Add an asynchronous job (to do in the GUI thread) *)
val async : ('a -> unit) -> 'a -> unit
(** Add a synchronous job (to do in the GUI thread).
    Raise [Failure "Tkthread.sync"] if there is no such thread. *)
val sync : ('a -> 'b) -> 'a -> 'b
(** Whether the current thread is the GUI thread.
    Note that when using X11 it is generally safe to call
    most Tk functions from other threads too. *)
val gui_safe : unit -> bool
(** Whether a GUI thread is running *)
val running : unit -> bool
