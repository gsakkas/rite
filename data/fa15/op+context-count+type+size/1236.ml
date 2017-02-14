
let rec sumList xs = match xs with | [] -> 0 | x::y -> x + y;;


(* fix

let rec sumList xs = match xs with | [] -> 0 | x::y -> x + (sumList y);;

*)

(* changed spans
(2,59)-(2,60)
*)

(* type error slice
(2,21)-(2,60)
(2,21)-(2,60)
(2,55)-(2,60)
(2,59)-(2,60)
*)
