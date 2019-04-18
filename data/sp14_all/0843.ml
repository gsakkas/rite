
let rec listReverse l = function | [] -> l | h::t -> listReverse (h :: l);;


(* fix

let rec listReverse l = match l with | [] -> l | (_::tail::[])::[] -> l;;

*)

(* changed spans
(2,25)-(2,74)
match l with
| [] -> l
| (_ :: tail :: []) :: [] -> l
CaseG (fromList [(ConsPatG (ConsPatG EmptyPatG EmptyPatG) (ConPatG Nothing),Nothing,VarG),(ConPatG Nothing,Nothing,VarG)])

*)

(* type error slice
(2,4)-(2,76)
(2,21)-(2,74)
(2,25)-(2,74)
(2,42)-(2,43)
(2,54)-(2,65)
(2,54)-(2,74)
(2,66)-(2,74)
(2,72)-(2,73)
*)
