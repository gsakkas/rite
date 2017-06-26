
let rec sumList xs = match 1 with | [] -> 0 | x::xs' -> x + (sumList xs');;


(* fix

let rec sumList xs = match xs with | [] -> 0 | x::xs' -> x + (sumList xs');;

*)

(* changed spans
(2,27)-(2,28)
*)

(* type error slice
(2,21)-(2,73)
(2,27)-(2,28)
*)

(* all spans
(2,16)-(2,73)
(2,21)-(2,73)
(2,27)-(2,28)
(2,42)-(2,43)
(2,56)-(2,73)
(2,56)-(2,57)
(2,60)-(2,73)
(2,61)-(2,68)
(2,69)-(2,72)
*)
