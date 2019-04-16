
let rec listReverse l =
  match l with | [] -> [] | h::t -> (listReverse t) :: h;;


(* fix

let rec listReverse l =
  let h::t = l in match l with | [] -> [] | h::t -> listReverse t;;

*)

(* changed spans
(3,3)-(3,57)
let h :: t = l in
match l with
| [] -> []
| h :: t -> listReverse t
LetG NonRec (fromList [(ConsPatG VarPatG VarPatG,VarG)]) (CaseG EmptyG (fromList [(ConsPatG EmptyPatG EmptyPatG,Nothing,EmptyG),(ConPatG Nothing,Nothing,EmptyG)]))

*)

(* type error slice
(2,4)-(3,59)
(2,21)-(3,57)
(3,3)-(3,57)
(3,37)-(3,52)
(3,37)-(3,57)
(3,38)-(3,49)
*)
