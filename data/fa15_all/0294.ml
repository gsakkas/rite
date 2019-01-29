
let rec listReverse l = match l with | [] -> [l] | h::t -> [listReverse t; h];;


(* fix

let rec listReverse l =
  match l with | h::t -> h :: (listReverse t) | [] -> [];;

*)

(* changed spans
(2,45)-(2,48)
match l with
| h :: t -> h :: (listReverse t)
| [] -> []
CaseG VarG (fromList [(Nothing,ConAppG (Just EmptyG) Nothing),(Nothing,ListG EmptyG Nothing)])

(2,59)-(2,77)
h :: (listReverse t)
ConAppG (Just (TupleG (fromList [VarG,AppG (fromList [VarG])]))) Nothing

(2,60)-(2,73)
h
VarG

(2,75)-(2,76)
[]
ListG EmptyG Nothing

*)
