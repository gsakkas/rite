
let rec sumList xs = match xs with | [] -> 0 | x::y -> x + (xs y);;


(* fix

let rec sumList xs = match xs with | [] -> 0 | x::y -> x + (sumList y);;

*)

(* changed spans
(2,61)-(2,63)
*)

(* type error slice
(2,22)-(2,65)
(2,22)-(2,65)
(2,22)-(2,65)
(2,22)-(2,65)
(2,28)-(2,30)
(2,61)-(2,63)
(2,61)-(2,65)
*)
