
let rec sumList xs = match xs with | [] -> [] | h::t -> 2 + 2;;


(* fix

let rec sumList xs = match xs with | [] -> 0 | h::t -> h + (sumList xs);;

*)

(* changed spans
(2,44)-(2,46)
(2,57)-(2,58)
(2,61)-(2,62)
*)

(* type error slice
(2,22)-(2,62)
(2,22)-(2,62)
(2,44)-(2,46)
(2,57)-(2,62)
*)
