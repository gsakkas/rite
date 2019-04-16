
let rec listReverse l =
  match l with | [] -> [] | h -> h | h::t -> h @ (listReverse [t]);;


(* fix

let rec listReverse l =
  match l with | [] -> [] | t -> t | h::t -> t @ (listReverse [h]);;

*)

(* changed spans
(3,3)-(3,67)
match l with
| [] -> []
| t -> t
| h :: t -> t @ listReverse [h]
CaseG VarG (fromList [(VarPatG,Nothing,VarG),(ConsPatG VarPatG VarPatG,Nothing,AppG (fromList [EmptyG])),(ConPatG Nothing,Nothing,ListG (fromList []))])

*)

(* type error slice
(3,3)-(3,67)
(3,34)-(3,35)
(3,46)-(3,47)
(3,46)-(3,67)
(3,48)-(3,49)
*)
