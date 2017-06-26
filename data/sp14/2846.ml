
let rec sumList xs = match sumList with | [] -> 0 | h::t -> h + (sumList t);;


(* fix

let rec sumList xs = match xs with | [] -> 0 | h::t -> h + (sumList t);;

*)

(* changed spans
(2,27)-(2,34)
*)

(* type error slice
(2,21)-(2,75)
(2,27)-(2,34)
(2,64)-(2,75)
(2,65)-(2,72)
*)

(* all spans
(2,16)-(2,75)
(2,21)-(2,75)
(2,27)-(2,34)
(2,48)-(2,49)
(2,60)-(2,75)
(2,60)-(2,61)
(2,64)-(2,75)
(2,65)-(2,72)
(2,73)-(2,74)
*)
