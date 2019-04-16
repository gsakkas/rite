
let rec mulByDigit i l = match l with | [] -> [] | h::t -> h * i;;


(* fix

let rec mulByDigit i l = match l with | [] -> [] | h::m::t -> t;;

*)

(* changed spans
(2,26)-(2,65)
match l with
| [] -> []
| h :: m :: t -> t
CaseG VarG (fromList [(ConsPatG VarPatG (ConsPatG EmptyPatG EmptyPatG),Nothing,VarG),(ConPatG Nothing,Nothing,ListG (fromList []))])

*)

(* type error slice
(2,26)-(2,65)
(2,47)-(2,49)
(2,60)-(2,65)
*)
