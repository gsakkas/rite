open EzyUtils

let lang_level_meta_file = "LANG_META.cmo"

let teachpack_meta_file = "TEACHPACK_META.cmo"

let easyocaml_global_dir_env = "EASYOCAML_GLOBAL_DIR"

let easyocaml_user_dir_env = "EASYOCAML_USER_DIR"

let lang_level_dir = "lang-levels"

let teachpack_dir = "teachpacks"

let search_dirs =
  let global = 
    try Sys.getenv easyocaml_global_dir_env
    with Not_found ->
      Filename.concat Config.standard_library (Filename.concat "site-lib" "easyocaml")
  in
  let user = 
    try Some (Sys.getenv easyocaml_user_dir_env)
    with Not_found ->
      try Some (Filename.concat (Sys.getenv "HOME") ".easyocaml")
      with Not_found -> None
  in
    match user with
      | Some u -> [u;global]
      | None -> [global]

let find_generic name meta_file =
  let rec loop = function
    | [] -> raise Not_found
    | (dir::rest) ->
        let dir' = Filename.concat dir (Filename.concat lang_level_dir name) in
        let fname = Filename.concat dir' meta_file
        in if Sys.file_exists fname then dir' else loop rest
  in loop search_dirs

let find_lang_level name = find_generic name lang_level_meta_file

let find_teachpack name = find_generic name teachpack_meta_file
