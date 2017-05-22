
let rec sumList xs = match xs with | [] -> 0 | x::y -> x + sumList;;


(* fix

let rec sumList xs = match xs with | [] -> 0 | x::y -> x + (sumList y);;

*)

(* changed spans
(2,59)-(2,66)
*)

(* type error slice
(2,3)-(2,68)
(2,16)-(2,66)
(2,55)-(2,66)
(2,59)-(2,66)
*)

(* all spans
(2,16)-(2,66)
(2,21)-(2,66)
(2,27)-(2,29)
(2,43)-(2,44)
(2,55)-(2,66)
(2,55)-(2,56)
(2,59)-(2,66)
*)
