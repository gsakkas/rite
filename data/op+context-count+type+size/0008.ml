
let rec sumList xs = match xs with | [] -> [] | x::xs' -> 1 sumList xs';;


(* fix

let rec sumList xs = match xs with | [] -> 0 | x::xs' -> x + (sumList xs');;

*)

(* changed spans
(2,44)-(2,46)
(2,59)-(2,60)
(2,59)-(2,72)
(2,61)-(2,68)
*)

(* type error slice
(2,22)-(2,72)
(2,59)-(2,60)
(2,59)-(2,72)
(2,61)-(2,68)
(2,69)-(2,72)
*)
