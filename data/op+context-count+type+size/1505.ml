
let rec sumList xs = match xs with | [] -> 0 | (x::y)::[] -> x + (sumList y);;


(* fix

let rec sumList xs = match xs with | [] -> 0 | x::y -> x + (sumList y);;

*)

(* changed spans
(2,22)-(2,76)
*)

(* type error slice
(2,4)-(2,79)
(2,17)-(2,76)
(2,22)-(2,76)
(2,28)-(2,30)
(2,44)-(2,45)
(2,67)-(2,74)
(2,67)-(2,76)
(2,75)-(2,76)
*)
