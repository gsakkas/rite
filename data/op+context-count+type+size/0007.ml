
let rec sumList xs = match xs with | [] -> [] | x::xs' -> x + (1 sumList xs');;



let rec sumList xs = match xs with | [] -> 0 | x::xs' -> x + (sumList xs');;


(* changed spans
(2,44)-(2,46)
(2,64)-(2,65)
*)

(* type error slice
(2,64)-(2,77)
*)
