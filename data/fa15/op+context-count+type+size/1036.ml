
let rec sumList xs = function | [] -> 0 | x::1 -> x + (sumList xs);;


(* fix

let rec sumList xs = match xs with | [] -> 0 | xf::xb -> xf + (sumList xb);;

*)

(* changed spans
(2,22)-(2,66)
(2,39)-(2,40)
(2,51)-(2,52)
(2,64)-(2,66)
*)

(* type error slice
(2,4)-(2,69)
(2,17)-(2,66)
(2,22)-(2,66)
(2,22)-(2,66)
(2,22)-(2,66)
(2,22)-(2,66)
(2,51)-(2,66)
(2,56)-(2,63)
(2,56)-(2,66)
*)
