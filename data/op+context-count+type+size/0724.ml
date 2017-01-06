
let rec sumList xs = match xs with | [] -> [] | h::t -> h + (sumList t);;



let rec sumList xs = match xs with | [] -> 0 | h::t -> h + (sumList t);;


(* changed spans
(2,44)-(2,46)
*)

(* type error slice
(2,22)-(2,71)
*)
