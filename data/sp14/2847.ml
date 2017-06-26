
let rec sumList xs = match sumList with | h::t -> h + (sumList t);;


(* fix

let rec sumList xs = match xs with | [] -> 0 | h::t -> h + (sumList t);;

*)

(* changed spans
(2,21)-(2,65)
(2,27)-(2,34)
(2,50)-(2,65)
*)

(* type error slice
(2,21)-(2,65)
(2,27)-(2,34)
(2,54)-(2,65)
(2,55)-(2,62)
*)

(* all spans
(2,16)-(2,65)
(2,21)-(2,65)
(2,27)-(2,34)
(2,50)-(2,65)
(2,50)-(2,51)
(2,54)-(2,65)
(2,55)-(2,62)
(2,63)-(2,64)
*)
