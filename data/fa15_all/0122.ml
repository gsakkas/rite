
let rec listReverse l =
  match l with | [] -> [] | h -> h | h::t -> h @ (listReverse t);;


(* fix

let rec listReverse l =
  match l with | [] -> [] | t -> t | h::t -> t @ (listReverse [h]);;

*)

(* changed spans
(3,2)-(3,64)
match l with
| [] -> []
| t -> t
| h :: t -> t @ listReverse [h]
CaseG VarG (fromList [(Nothing,VarG),(Nothing,AppG (fromList [EmptyG])),(Nothing,ListG EmptyG Nothing)])

(3,33)-(3,34)
t
VarG

(3,45)-(3,46)
t
VarG

(3,62)-(3,63)
[h]
ListG VarG Nothing

*)
