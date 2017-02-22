(***********************************************************************)
(*                             OCamldoc                                *)
(*                                                                     *)
(*            Maxence Guesdon, projet Cristal, INRIA Rocquencourt      *)
(*                                                                     *)
(*  Copyright 2001 Institut National de Recherche en Informatique et   *)
(*  en Automatique.  All rights reserved.  This file is distributed    *)
(*  under the terms of the Q Public License version 1.0.               *)
(*                                                                     *)
(***********************************************************************)

(* $Id: odoc_scan.ml,v 1.3 2003/11/24 10:43:11 starynke Exp $ *)

(** Scanning of modules and elements.

   The class scanner defined in this module can be used to
   develop generators which perform controls on the elements
   and their comments. 
*)

open Odoc_types

(** Class which defines the scanning of a list of modules and their
   elements. Inherit this class to develop your own scanner, by 
   overriding some methods.*)
class scanner =
  object (self)
  (** Scan of 'leaf elements'. *)

    method scan_value (v : Odoc_value.t_value) = ()
    method scan_type (t : Odoc_type.t_type) = ()
    method scan_exception (e : Odoc_exception.t_exception) = ()
    method scan_attribute (a : Odoc_value.t_attribute) = ()
    method scan_method (m : Odoc_value.t_method) = ()
    method scan_included_module (im : Odoc_module.included_module) = ()

  (** Scan of a class. *)    

    (** Scan of a comment inside a class. *)
    method scan_class_comment (t : text) = ()

    (** Override this method to perform controls on the class comment
       and params. This method is called before scanning the class elements. 
       @return true if the class elements must be scanned.*)
    method scan_class_pre (c : Odoc_class.t_class) = true

    (** This method scan the elements of the given class. 
       A VOIR : scan des classes h�rit�es.*)
    method scan_class_elements c =
      List.iter 
        (fun ele -> 
          match ele with
            Odoc_class.Class_attribute a -> self#scan_attribute a 
          | Odoc_class.Class_method m -> self#scan_method m
          | Odoc_class.Class_comment t -> self#scan_class_comment t
        )
        (Odoc_class.class_elements c)

    (** Scan of a class. Should not be overriden. It calls [scan_class_pre]
      and if [scan_class_pre] returns [true], then it calls scan_class_elements.*)
    method scan_class c = if self#scan_class_pre c then self#scan_class_elements c

  (** Scan of a class type. *)

    (** Scan of a comment inside a class type. *)
    method scan_class_type_comment (t : text) = ()

    (** Override this method to perform controls on the class type comment
       and form. This method is called before scanning the class type elements. 
       @return true if the class type elements must be scanned.*)
    method scan_class_type_pre (ct : Odoc_class.t_class_type) = true

    (** This method scan the elements of the given class type. 
       A VOIR : scan des classes h�rit�es.*)
    method scan_class_type_elements ct =
      List.iter 
        (fun ele -> 
          match ele with
            Odoc_class.Class_attribute a -> self#scan_attribute a 
          | Odoc_class.Class_method m -> self#scan_method m
          | Odoc_class.Class_comment t -> self#scan_class_type_comment t
        )
        (Odoc_class.class_type_elements ct)

    (** Scan of a class type. Should not be overriden. It calls [scan_class_type_pre]
      and if [scan_class_type_pre] returns [true], then it calls scan_class_type_elements.*)
    method scan_class_type ct = if self#scan_class_type_pre ct then self#scan_class_type_elements ct

  (** Scan of modules. *)

    (** Scan of a comment inside a module. *)
    method scan_module_comment (t : text) = ()

    (** Override this method to perform controls on the module comment
       and form. This method is called before scanning the module elements. 
       @return true if the module elements must be scanned.*)
    method scan_module_pre (m : Odoc_module.t_module) = true

    (** This method scan the elements of the given module. *)
    method scan_module_elements m =
      List.iter 
        (fun ele -> 
          match ele with
            Odoc_module.Element_module m -> self#scan_module m
          | Odoc_module.Element_module_type mt -> self#scan_module_type mt
          | Odoc_module.Element_included_module im -> self#scan_included_module im
          | Odoc_module.Element_class c -> self#scan_class c
          | Odoc_module.Element_class_type ct -> self#scan_class_type ct
          | Odoc_module.Element_value v -> self#scan_value v
          | Odoc_module.Element_exception e -> self#scan_exception e
          | Odoc_module.Element_type t -> self#scan_type t
          | Odoc_module.Element_module_comment t -> self#scan_module_comment t
        )
        (Odoc_module.module_elements m)

    (** Scan of a module. Should not be overriden. It calls [scan_module_pre]
      and if [scan_module_pre] returns [true], then it calls scan_module_elements.*)
    method scan_module m = if self#scan_module_pre m then self#scan_module_elements m

  (** Scan of module types. *)

    (** Scan of a comment inside a module type. *)
    method scan_module_type_comment (t : text) = ()

    (** Override this method to perform controls on the module type comment
       and form. This method is called before scanning the module type elements. 
       @return true if the module type elements must be scanned. *)
    method scan_module_type_pre (mt : Odoc_module.t_module_type) = true

    (** This method scan the elements of the given module type. *)
    method scan_module_type_elements mt =
      List.iter 
        (fun ele -> 
          match ele with
            Odoc_module.Element_module m -> self#scan_module m
          | Odoc_module.Element_module_type mt -> self#scan_module_type mt
          | Odoc_module.Element_included_module im -> self#scan_included_module im
          | Odoc_module.Element_class c -> self#scan_class c
          | Odoc_module.Element_class_type ct -> self#scan_class_type ct
          | Odoc_module.Element_value v -> self#scan_value v
          | Odoc_module.Element_exception e -> self#scan_exception e
          | Odoc_module.Element_type t -> self#scan_type t
          | Odoc_module.Element_module_comment t -> self#scan_module_comment t
        )
        (Odoc_module.module_type_elements mt)

    (** Scan of a module type. Should not be overriden. It calls [scan_module_type_pre]
      and if [scan_module_type_pre] returns [true], then it calls scan_module_type_elements.*)
    method scan_module_type mt = 
      if self#scan_module_type_pre mt then self#scan_module_type_elements mt

  (** Main scanning method. *)

    (** Scan a list of modules. *)
    method scan_module_list l = List.iter self#scan_module l
  end
