
let rec sumList xs = function | [] -> 0 | h::t -> h + (sumList t);;


(* fix

let rec sumList xs = match xs with | [] -> 0 | h::t -> h + (sumList t);;

*)

(* changed spans
(2,22)-(2,65)
*)

(* type error slice
(2,17)-(2,65)
(2,22)-(2,65)
(2,22)-(2,65)
(2,22)-(2,65)
(2,22)-(2,65)
(2,22)-(2,65)
(2,22)-(2,65)
(2,51)-(2,52)
(2,56)-(2,63)
(2,56)-(2,65)
(2,56)-(2,65)
(2,64)-(2,65)
*)
