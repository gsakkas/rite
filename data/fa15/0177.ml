
let rec sumList xs = match xs with | [] -> [] | h::t -> h + sumList;;


(* fix

let rec sumList xs = match xs with | [] -> 0 | h::t -> h + (sumList xs);;

*)

(* changed spans
(2,43)-(2,45)
(2,60)-(2,67)
*)

(* type error slice
(2,3)-(2,69)
(2,16)-(2,67)
(2,21)-(2,67)
(2,43)-(2,45)
(2,56)-(2,67)
(2,60)-(2,67)
*)

(* all spans
(2,16)-(2,67)
(2,21)-(2,67)
(2,27)-(2,29)
(2,43)-(2,45)
(2,56)-(2,67)
(2,56)-(2,57)
(2,60)-(2,67)
*)
