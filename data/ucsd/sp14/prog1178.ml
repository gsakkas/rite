
let rec assoc (d,k,l) =
  match l with | [] -> k | (s,i)::xs -> if k = s then i else assoc (d, k, xs);;

let _ = assoc ((-1), "bob", [("ranjit", 85); ("william", 23); ("moose", 44)]);;
