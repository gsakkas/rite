
let rec sumList xs = match 1 with | [] -> 0 | x::xs' -> x + (sumList xs');;


(* fix

let rec sumList xs = match xs with | [] -> 0 | x::xs' -> x + (sumList xs');;

*)

(* changed spans
(2,27)-(2,28)
*)

(* type error slice
(2,21)-(2,73)
(2,21)-(2,73)
(2,21)-(2,73)
(2,21)-(2,73)
(2,27)-(2,28)
*)
