
let rec listReverse l =
  match l with | [] -> [] | h::t -> t :: (listReverse h);;


(* fix

let rec listReverse l =
  match l with | [] -> [] | h -> h | h::t -> t @ (listReverse [h]);;

*)

(* changed spans
(3,2)-(3,56)
match l with
| [] -> []
| h -> h
| h :: t -> t @ listReverse [h]
CaseG VarG (fromList [(Nothing,VarG),(Nothing,AppG (fromList [EmptyG])),(Nothing,ListG EmptyG Nothing)])

(3,36)-(3,37)
(@)
VarG

(3,36)-(3,37)
t @ listReverse [h]
AppG (fromList [VarG,AppG (fromList [EmptyG])])

(3,36)-(3,56)
h
VarG

(3,54)-(3,55)
[h]
ListG VarG Nothing

*)
