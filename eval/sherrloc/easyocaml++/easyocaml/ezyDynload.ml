module type S = sig
  val kind : string
  val meta_file : string
  val module_name : string
  val find : string -> string
  val reset : unit -> unit
  type result
  val get : unit -> result option
end

module LangLevel = struct
  type result = (EzyFeatures.program_feats * (string * bool) list * string list)
  let config_result : result option ref = ref None

  let kind = "language level"
  let meta_file = EzyConfig.lang_level_meta_file
  let module_name = "EzyLangLevel"
  let find = EzyConfig.find_lang_level
  let reset () = config_result := None
  let get () = !config_result
end

module Teachpack = struct
  type result = (string * bool) list * string list

  let config_result : result option ref = ref None

  let kind = "teachpack"
  let meta_file = EzyConfig.teachpack_meta_file
  let module_name = "EzyTeachpack"
  let find = EzyConfig.find_teachpack
  let reset () = config_result := None
  let get () = !config_result
end
