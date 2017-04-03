
let rec sumList xs = match xs with | [] -> [] | h::t -> 2 + 2;;


(* fix

let rec sumList xs = match xs with | [] -> 0 | h::t -> h + (sumList xs);;

*)

(* changed spans
(2,43)-(2,45)
(2,56)-(2,57)
(2,60)-(2,61)
*)

(* type error slice
(2,21)-(2,61)
(2,21)-(2,61)
(2,43)-(2,45)
(2,56)-(2,61)
*)

(* all spans
(2,16)-(2,61)
(2,21)-(2,61)
(2,27)-(2,29)
(2,43)-(2,45)
(2,56)-(2,61)
(2,56)-(2,57)
(2,60)-(2,61)
*)
