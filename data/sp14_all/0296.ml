
let rec listReverse l =
  match l with | h::t -> h :: (l listReverse t) | [] -> [];;


(* fix

let rec listReverse l = match l with | [] -> l | h::t -> h :: (listReverse t);;

*)

(* changed spans
(3,3)-(3,59)
match l with
| [] -> l
| h :: t -> h :: (listReverse t)
CaseG VarG (fromList [(ConsPatG VarPatG VarPatG,Nothing,ConAppG (Just EmptyG)),(ConPatG Nothing,Nothing,VarG)])

*)

(* type error slice
(3,3)-(3,59)
(3,9)-(3,10)
(3,31)-(3,48)
(3,32)-(3,33)
*)
