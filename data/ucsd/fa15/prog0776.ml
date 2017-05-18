
let rec assoc (d,k,l) =
  match l with
  | [] -> d
  | (s,i)::t -> (match k with | (s,i) -> i | _ -> assoc (d, k, t));;

let _ = assoc ((-1), "bob", [("ranjit", 85); ("william", 23); ("moose", 44)]);;
