
let rec sumList xs = match xs with | o -> o | h::xs' -> h + (sumList xs');;


(* fix

let rec sumList xs = match xs with | [] -> 0 | h::t -> h + (sumList t);;

*)

(* changed spans
(2,22)-(2,73)
(2,43)-(2,44)
(2,70)-(2,73)
*)

(* type error slice
(2,4)-(2,76)
(2,17)-(2,73)
(2,22)-(2,73)
(2,22)-(2,73)
(2,22)-(2,73)
(2,22)-(2,73)
(2,22)-(2,73)
(2,43)-(2,44)
(2,57)-(2,73)
(2,57)-(2,73)
(2,62)-(2,69)
(2,62)-(2,73)
*)
