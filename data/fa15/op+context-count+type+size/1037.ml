
let rec sumList xs = function | [] -> 0 | x::xs -> x + (sumList xs);;


(* fix

let rec sumList xs = match xs with | [] -> 0 | xf::xb -> xf + (sumList xb);;

*)

(* changed spans
(2,21)-(2,67)
(2,38)-(2,39)
(2,51)-(2,52)
(2,64)-(2,66)
*)

(* type error slice
(2,3)-(2,69)
(2,16)-(2,67)
(2,21)-(2,67)
(2,51)-(2,67)
(2,55)-(2,67)
(2,56)-(2,63)
*)
