
let rec sumList xs = match xs with | [] -> 0 | (x::y)::[] -> x + (sumList y);;


(* fix

let rec sumList xs = match xs with | [] -> 0 | x::y -> x + (sumList y);;

*)

(* changed spans
(2,22)-(2,77)
match xs with
| [] -> 0
| x :: y -> x + sumList y
CaseG (fromList [(ConsPatG VarPatG VarPatG,Nothing,BopG EmptyG EmptyG),(ConPatG Nothing,Nothing,LitG)])

*)

(* type error slice
(2,4)-(2,79)
(2,17)-(2,77)
(2,22)-(2,77)
(2,28)-(2,30)
(2,66)-(2,77)
(2,67)-(2,74)
(2,75)-(2,76)
*)
