
let rec sumList xs = function | [] -> 0 | xf::xb -> xf + (sumList xb);;


(* fix

let rec sumList xs = match xs with | [] -> 0 | xf::xb -> xf + (sumList xb);;

*)

(* changed spans
(2,21)-(2,69)
*)

(* type error slice
(2,3)-(2,71)
(2,16)-(2,69)
(2,21)-(2,69)
(2,52)-(2,69)
(2,57)-(2,69)
(2,58)-(2,65)
*)

(* all spans
(2,16)-(2,69)
(2,21)-(2,69)
(2,38)-(2,39)
(2,52)-(2,69)
(2,52)-(2,54)
(2,57)-(2,69)
(2,58)-(2,65)
(2,66)-(2,68)
*)
