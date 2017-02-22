(***********************************************************************)
(*                                                                     *)
(*                 MLTk, Tcl/Tk interface of Objective Caml            *)
(*                                                                     *)
(*    Francois Rouaix, Francois Pessaux, Jun Furuse and Pierre Weis    *)
(*               projet Cristal, INRIA Rocquencourt                    *)
(*            Jacques Garrigue, Kyoto University RIMS                  *)
(*                                                                     *)
(*  Copyright 2002 Institut National de Recherche en Informatique et   *)
(*  en Automatique and Kyoto University.  All rights reserved.         *)
(*  This file is distributed under the terms of the GNU Library        *)
(*  General Public License, with the special exception on linking      *)
(*  described in file LICENSE found in the Objective Caml source tree. *)
(*                                                                     *)
(***********************************************************************)

(* $Id: widget.mli,v 1.7 2002/04/26 12:16:22 furuse Exp $ *)

(* Support for widget manipulations *)

type 'a widget = 'a Rawwidget.raw_widget
  (* widget is an abstract type *)

type any = Rawwidget.raw_any
and button
and canvas
and checkbutton
and entry
and frame
and label
and listbox
and menu
and menubutton
and message
and radiobutton
and scale
and scrollbar
and text
and toplevel

val forget_type : 'a widget -> any widget
val coe : 'a widget -> any widget

val default_toplevel : toplevel widget
  (* [default_toplevel] is "." in Tk, the toplevel widget that is
     always existing during a Tk session. Destroying [default_toplevel]
     ends the main loop
   *)

val atom : parent: 'a widget -> name: string -> any widget
  (* [atom parent name] returns the widget [parent.name]. The widget is
     not created. Only its name is returned. In a given parent, there may
     only exist one children for a given name.
     This function should only be used to check the existence of a widget
     with a known name. It doesn't add the widget to the internal tables
     of CamlTk.
   *)

val name : 'a widget -> string
  (* [name w] returns the name (tk "path") of a widget *)

(*--*)
(* The following functions are used internally.
   There is normally no need for them in users programs
 *)

val known_class : 'a widget -> string
  (* [known_class w] returns the class of a widget (e.g. toplevel, frame),
     as known by the CamlTk interface.
     Not equivalent to "winfo w" in Tk.
   *)

val dummy : any widget
  (* [dummy] is a widget used as context when we don't have any.
     It is *not* a real widget.
   *)
          
val new_atom : parent:'a widget -> ?name: string -> string -> 'b widget

val get_atom : string -> any widget
  (* [get_atom path] returns the widget with Tk path [path] *)

val remove : 'a widget -> unit
  (* [remove w] removes widget from the internal tables *)

(* Subtypes tables *)
val widget_any_table : string list
val widget_button_table : string list
val widget_canvas_table : string list
val widget_checkbutton_table : string list
val widget_entry_table : string list
val widget_frame_table : string list
val widget_label_table : string list
val widget_listbox_table : string list
val widget_menu_table : string list
val widget_menubutton_table : string list
val widget_message_table : string list
val widget_radiobutton_table : string list
val widget_scale_table : string list
val widget_scrollbar_table : string list
val widget_text_table : string list
val widget_toplevel_table : string list

val chk_sub : string -> 'a list -> 'a -> unit
val check_class : 'a widget -> string list -> unit
      (* Widget subtyping *)

exception IllegalWidgetType of string
      (* Raised when widget command applied illegally*)
