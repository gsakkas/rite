
let rec sumList xs = match xs with | [] -> 0 | x::y -> x + sumList;;


(* fix

let rec sumList xs = match xs with | [] -> 0 | x::y -> x + (sumList y);;

*)

(* changed spans
(2,60)-(2,67)
sumList y
AppG [VarG]

*)

(* type error slice
(2,4)-(2,69)
(2,17)-(2,67)
(2,56)-(2,67)
(2,60)-(2,67)
*)
