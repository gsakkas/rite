
let rec sumList xs = function | [] -> 0 | x::1 -> x + (sumList xs);;


(* fix

let rec sumList xs = match xs with | [] -> 0 | xf::xb -> xf + (sumList xb);;

*)

(* changed spans
(2,21)-(2,66)
(2,38)-(2,39)
(2,50)-(2,51)
(2,63)-(2,65)
*)

(* type error slice
(2,3)-(2,68)
(2,16)-(2,66)
(2,21)-(2,66)
(2,21)-(2,66)
(2,21)-(2,66)
(2,21)-(2,66)
(2,50)-(2,66)
(2,54)-(2,66)
(2,55)-(2,62)
*)
