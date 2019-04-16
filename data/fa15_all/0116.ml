
let rec listReverse l =
  match l with | [] -> [] | h::t -> t :: (listReverse h);;


(* fix

let rec listReverse l =
  match l with | [] -> [] | h -> h | h::t -> t @ (listReverse [h]);;

*)

(* changed spans
(3,3)-(3,57)
match l with
| [] -> []
| h -> h
| h :: t -> t @ listReverse [h]
CaseG VarG (fromList [(VarPatG,Nothing,VarG),(ConsPatG VarPatG VarPatG,Nothing,AppG (fromList [EmptyG])),(ConPatG Nothing,Nothing,ListG (fromList []))])

*)

(* type error slice
(2,4)-(3,59)
(2,21)-(3,57)
(3,3)-(3,57)
(3,9)-(3,10)
(3,42)-(3,57)
(3,43)-(3,54)
(3,55)-(3,56)
*)
