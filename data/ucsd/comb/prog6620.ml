
let rec assoc (d,k,l) =
  match l with
  | [] -> d
  | (name,age)::l' -> if k = name then age else assoc (d, k, l');;

let _ = assoc ([(1, 1)], "a", [(([(1, 2)], "c"), ([(1, 1, 1)], "a"))]);;
