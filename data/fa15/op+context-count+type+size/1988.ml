
let rec sumList xs = match xs with | o -> o | h::xs' -> h + (sumList xs');;


(* fix

let rec sumList xs = match xs with | [] -> 0 | h::t -> h + (sumList t);;

*)

(* changed spans
(2,21)-(2,73)
(2,42)-(2,43)
(2,69)-(2,72)
*)

(* type error slice
(2,3)-(2,75)
(2,16)-(2,73)
(2,21)-(2,73)
(2,21)-(2,73)
(2,21)-(2,73)
(2,21)-(2,73)
(2,21)-(2,73)
(2,42)-(2,43)
(2,56)-(2,73)
(2,56)-(2,73)
(2,60)-(2,73)
(2,61)-(2,68)
*)
