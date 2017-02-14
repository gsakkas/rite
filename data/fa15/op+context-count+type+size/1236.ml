
let rec sumList xs = match xs with | [] -> 0 | x::y -> x + y;;


(* fix

let rec sumList xs = match xs with | [] -> 0 | x::y -> x + (sumList y);;

*)

(* changed spans
(2,60)-(2,61)
*)

(* type error slice
(2,22)-(2,61)
(2,22)-(2,61)
(2,56)-(2,61)
(2,60)-(2,61)
*)
