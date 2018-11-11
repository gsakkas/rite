
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
CaseG VarG [(Nothing,ListG EmptyG Nothing),(Nothing,ConAppG (Just EmptyG) Nothing)]

(3,26)-(3,27)
h :: (listReverse t)
ConAppG (Just (TupleG [VarG,AppG [VarG]])) Nothing

(3,26)-(3,27)
[]
ListG EmptyG Nothing

*)
