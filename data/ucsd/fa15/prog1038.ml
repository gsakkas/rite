
let rec assoc (d,k,l) =
  match l with
  | [] -> d
  | h::l' -> (match h with | (a,b) -> if a = k then b assoc (d, k, l'));;
