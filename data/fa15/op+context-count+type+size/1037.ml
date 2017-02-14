
let rec sumList xs = function | [] -> 0 | x::xs -> x + (sumList xs);;


(* fix

let rec sumList xs = match xs with | [] -> 0 | xf::xb -> xf + (sumList xb);;

*)

(* changed spans
(2,22)-(2,67)
(2,39)-(2,40)
(2,52)-(2,53)
(2,65)-(2,67)
*)

(* type error slice
(2,4)-(2,70)
(2,17)-(2,67)
(2,22)-(2,67)
(2,52)-(2,67)
(2,57)-(2,64)
(2,57)-(2,67)
*)
