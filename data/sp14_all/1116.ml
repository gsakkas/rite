
let rec listReverse l =
  match l with | [] -> [] | t::h::[] -> h :: (listReverse t);;


(* fix

let rec listReverse l =
  match l with | [] -> [] | _::h::[] -> h :: (listReverse []);;

*)

(* changed spans
(3,2)-(3,60)
match l with
| [] -> []
| _ :: h :: [] -> h :: (listReverse [])
CaseG VarG (fromList [(Nothing,ConAppG (Just EmptyG) Nothing),(Nothing,ListG EmptyG Nothing)])

(3,58)-(3,59)
[]
ListG EmptyG Nothing

*)
