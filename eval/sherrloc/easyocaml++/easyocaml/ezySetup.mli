open EzyFeatures

type t = { features : program_feats option;       (** allowed features; if None then no language restrictions are in place *)
           modules : (string * bool) list option; (** accessible modules; if the bool flag is true, the module is opened automatically;
                                                      if None then the module restrictions are in placed*)
           inc_dirs : string list;                (** list of directories that should be added to the load path *)
           obj_files : string list;               (** list of object files *)
         }

val default : t

val setup : unit -> t
