
let rec sumList xs = match xs with | [] -> [] | x::xs' -> x + (sumList xs');;


(* fix

let rec sumList xs = match xs with | [] -> 0 | x::xs' -> x + (sumList xs');;

*)

(* changed spans
(2,44)-(2,46)
*)

(* type error slice
(2,4)-(2,78)
(2,17)-(2,75)
(2,22)-(2,75)
(2,22)-(2,75)
(2,44)-(2,46)
(2,59)-(2,75)
(2,59)-(2,75)
(2,64)-(2,71)
(2,64)-(2,75)
*)
