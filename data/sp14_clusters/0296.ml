
let rec listReverse l =
  match l with | h::t -> h :: (l listReverse t) | [] -> [];;


(* fix

let rec listReverse l = match l with | [] -> l | h::t -> h :: (listReverse t);;

*)

(* changed spans
(3,2)-(3,58)
match l with
| [] -> l
| h :: t -> h :: (listReverse t)
CaseG VarG [(Nothing,VarG),(Nothing,ConAppG (Just (TupleG [VarG,AppG [VarG]])) Nothing)]

(3,25)-(3,47)
l
VarG

(3,31)-(3,32)
listReverse t
AppG [VarG]

*)
