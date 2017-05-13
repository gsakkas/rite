
let rec assoc (d,k,l) =
  match l with
  | [] -> d
  | h::t ->
      (match h with | () -> d | (a,b) -> if a = k then b else assoc (d, k, t));;
