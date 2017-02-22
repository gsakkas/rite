(*
How easyocaml finds language levels and teachpacks:

There is a global and a user configuration directory. First, easyocaml
searches the user then the global configuration directory.

Here's how the global configuration directory is determined (in
descending preference):

 (1) Environment variable EASYOCAML_GLOBAL_DIR
 (2) Compile-time option

Here's how the user configuration directory is determined (in
descending preference):

 (1) Environment variable EASYOCAML_USER_DIR
 (2) $HOME/.easyocaml

Layout of the easyocaml configuration directory:

 language-levels/level-1
                 level-2
                 ...
 teachpacks/tp-1
            tp-2
            ...
*)

val search_dirs : string list

(** Filename of the meta file describing a language level. *)
val lang_level_meta_file : string

(** Filename of the meta file describing a teachpack. *)
val teachpack_meta_file : string

(** Turns the name of a language level into an absolute path pointing
    to the root directory of the language level. Ensures that a
    meta file exists in this directory.
    Raises Not_found if no such language level exists. *)
val find_lang_level : string -> string

(** Turns the name of a teachpack into an absolute path pointing
    to the root directory of the teachpack.
    Raises Not_found if no such teachpack exists. *)
val find_teachpack : string -> string
