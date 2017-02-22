open EzyUtils
open EzyTypingCoreTypes
open EzyOcamlmodules
open EzyErrors

let logger = new Logger.logger "dummy err report"

module ErrorReporter = struct

  let name = "Dummy error reporter"

  let print_errors ?program ast ppf errors =
    Format.fprintf ppf "Lots of errors@."

  let print_heavies ?program ast ppf heavies =
    Format.fprintf ppf "Lots of heavy errors@."

  let print_fatal ?program loc ppf fatal =
    Format.fprintf ppf "A fatal error: %a@." EzyErrors.print_fatal_error_desc fatal
end

let _ =
  let module M = EzyErrors.Register (ErrorReporter) in () ;
