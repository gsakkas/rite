open EzyFeatures

type t = { features : program_feats;       (** allowed features *)
           modules : (string * bool) list; (** accessible modules; if the bool flag is true, the module is opened automatically *)
           inc_dirs : string list;         (** list of directories that should be added to the load path *)
           obj_files : string list;        (** list of object files *)
         }

val empty : t

val load : string (* name of the language level *) -> t

val extend_with_teachpack : t -> string (* name of the teachpack *) -> t

