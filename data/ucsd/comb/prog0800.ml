
let rec assoc (d,k,l) =
  match l with
  | [] -> d
  | h::t ->
      (match h with | (k1,v1) -> if k = k1 then v1 else assoc (d, k, t));;

let _ =
  assoc ((-1), "william", [("ranjit", 85); ("william", 23); ("moose", 44)])
    23;;
