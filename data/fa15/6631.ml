
let rec sumList xs = if xs == [] then 0;;


(* fix

let rec sumList xs = match xs with | [] -> 0 | h::t -> h + (sumList t);;

*)

(* changed spans
(2,21)-(2,39)
(2,24)-(2,32)
(2,30)-(2,32)
*)

(* type error slice
(2,21)-(2,39)
(2,21)-(2,39)
(2,21)-(2,39)
(2,38)-(2,39)
*)

(* all spans
(2,16)-(2,39)
(2,21)-(2,39)
(2,24)-(2,32)
(2,24)-(2,26)
(2,30)-(2,32)
(2,38)-(2,39)
(2,21)-(2,39)
*)
