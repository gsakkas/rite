
let rec sumList xs = match xs with | [] -> 0 | h::t -> h + t;;



let rec sumList xs = match xs with | [] -> 0;;


(* changed spans
(2,46)-(2,61)
*)

(* type error slice
(2,22)-(2,61)
(2,56)-(2,61)
*)
