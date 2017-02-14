
let rec sumList xs = match xs with | [] -> [] | x::xs' -> 1 sumList xs';;


(* fix

let rec sumList xs = match xs with | [] -> 0 | x::xs' -> x + (sumList xs');;

*)

(* changed spans
(2,43)-(2,45)
(2,58)-(2,59)
(2,58)-(2,71)
(2,60)-(2,67)
*)

(* type error slice
(2,58)-(2,59)
(2,58)-(2,71)
*)
