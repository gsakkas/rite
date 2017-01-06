
let rec sumList xs = match xs with | [] -> [] | x::xs' -> x sumList xs';;



let rec sumList xs = match xs with | [] -> 0 | x::xs' -> x + (sumList xs');;


(* changed spans
(2,44)-(2,46)
*)

(* type error slice
(2,59)-(2,72)
*)
