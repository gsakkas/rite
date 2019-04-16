
let rec listReverse l = match l with | [] -> [] | h::t -> [listReverse t; h];;


(* fix

let rec listReverse l =
  let h::t = l in match l with | [] -> [] | h::t -> listReverse t;;

*)

(* changed spans
(2,25)-(2,77)
let h :: t = l in
match l with
| [] -> []
| h :: t -> listReverse t
LetG NonRec (fromList [(ConsPatG VarPatG VarPatG,VarG)]) (CaseG EmptyG (fromList [(ConsPatG EmptyPatG EmptyPatG,Nothing,EmptyG),(ConPatG Nothing,Nothing,EmptyG)]))

*)

(* type error slice
(2,4)-(2,79)
(2,21)-(2,77)
(2,25)-(2,77)
(2,59)-(2,77)
(2,60)-(2,71)
(2,60)-(2,73)
*)
