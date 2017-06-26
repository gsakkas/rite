
let rec sumList xs = match 1 with | [] -> 0 | h::t -> h + (sumList t);;


(* fix

let rec sumList xs = match xs with | [] -> 0 | h::t -> h + (sumList t);;

*)

(* changed spans
(2,27)-(2,28)
*)

(* type error slice
(2,21)-(2,69)
(2,27)-(2,28)
*)

(* all spans
(2,16)-(2,69)
(2,21)-(2,69)
(2,27)-(2,28)
(2,42)-(2,43)
(2,54)-(2,69)
(2,54)-(2,55)
(2,58)-(2,69)
(2,59)-(2,66)
(2,67)-(2,68)
*)
