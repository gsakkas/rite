
let assoc (d,k,l) =
  match l with
  | h::t ->
      let rec helper di ki li = match li with | h::t -> h in helper d k h;;

let _ =
  assoc ((-1), "william", [("ranjit", 85); ("william", 23); ("moose", 44)]);;
