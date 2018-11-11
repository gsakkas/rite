
let rec listReverse l = function | [] -> l | h::t -> listReverse (h :: l);;


(* fix

let rec listReverse l = match l with | [] -> l | (_::tail::[])::[] -> l;;

*)

(* changed spans
(2,24)-(2,73)
match l with
| [] -> l
| (_ :: tail :: []) :: [] -> l
CaseG VarG [(Nothing,VarG),(Nothing,VarG)]

*)
