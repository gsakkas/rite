open EzyFeatures
open EzyUtils

type t = { features : program_feats;      (** Allowed features *)
           modules : (string *bool) list; (** All accessible modules. The bool flag marks module that should be automatically opened *)
           inc_dirs : string list;        (** List of directories that should be added to the load path *)
           obj_files : string list;       (** list of object files *)
         }

let empty = { features = all_program_feats true; modules = []; inc_dirs = []; obj_files = [] }

let teachpack_config_result = ref None

let configure_teachpack modules = teachpack_config_result := Some modules

let _ = Dynlink.init ()

module LoaderF (D: EzyDynload.S) : sig
  val load : string -> (string * D.result)
end = struct
  let load name = 
    let dir = 
      try D.find name
      with Not_found -> 
        Misc.fatal_error (format_str "%s %s not found in %a" D.kind name (List.print Format.pp_print_string ", ") EzyConfig.search_dirs)
    in
    let meta_file = Filename.concat dir D.meta_file in
    let report_error s = 
      Misc.fatal_error ("An exception occurred while loading " ^ D.kind ^ " from file \"" ^ meta_file ^ "\": " ^ s)
    in
      D.reset ();
      (* Dynlink.allow_only [D.module_name]; *)
      (try
         Dynlink.loadfile meta_file;
       with
         | Dynlink.Error e -> report_error (Dynlink.error_message e)
         | exc -> report_error (Printexc.to_string exc)
      );
      (* Dynlink.default_available_units (); *)
      match D.get () with
        | None -> Misc.fatal_error (("Cannot load " ^ D.kind ^ " from file " ^ meta_file ^ ": configure function not called"))
        | Some x -> (dir, x)  
end

module LangLevelLoader = LoaderF(EzyDynload.LangLevel)
module TeachpackLoader = LoaderF(EzyDynload.Teachpack)

let load name = 
  let (dir, (features, modules, objs')) = LangLevelLoader.load name in
  let objs = List.map (Filename.concat dir) objs' in
    { features = features; modules = modules; inc_dirs = [dir]; obj_files = objs }

let extend_with_teachpack t name =
  let (dir, (modules, objs')) = TeachpackLoader.load name in
  let objs = List.map (Filename.concat dir) objs' in
    { t with modules = t.modules @ modules; inc_dirs = t.inc_dirs @ [dir]; obj_files = t.obj_files @ objs }
