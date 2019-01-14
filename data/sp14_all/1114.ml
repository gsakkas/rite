
let rec listReverse l =
  match l with | h::[] -> h | h::t -> [listReverse t; h];;


(* fix

let rec listReverse l =
  match l with | [] -> [] | h::t -> h :: (listReverse t);;

*)

(* changed spans
(3,2)-(3,56)
match l with
| [] -> []
| h :: t -> h :: (listReverse t)
CaseG VarG (fromList [(Nothing,ConAppG (Just EmptyG) Nothing),(Nothing,ListG EmptyG Nothing)])

(3,26)-(3,27)
h :: (listReverse t)
ConAppG (Just (TupleG (fromList [VarG,AppG (fromList [VarG])]))) Nothing

(3,26)-(3,27)
[]
ListG EmptyG Nothing

*)
