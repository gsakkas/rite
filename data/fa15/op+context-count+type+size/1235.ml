
let rec sumList xs = match xs with | [] -> 0 | x::y -> x + (xs y);;


(* fix

let rec sumList xs = match xs with | [] -> 0 | x::y -> x + (sumList y);;

*)

(* changed spans
(2,60)-(2,62)
*)

(* type error slice
(2,21)-(2,65)
(2,21)-(2,65)
(2,21)-(2,65)
(2,21)-(2,65)
(2,27)-(2,29)
(2,59)-(2,65)
(2,60)-(2,62)
*)
