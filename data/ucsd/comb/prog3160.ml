
let rec assoc (d,k,l) =
  match l with
  | [] -> d
  | (s,i)::t -> (match k = i with | true  -> i | false  -> assoc (d, k, t));;

let _ =
  assoc ((-1), "william", [("ranjit", 85); ("william", 23); ("moose", 44)]);;
