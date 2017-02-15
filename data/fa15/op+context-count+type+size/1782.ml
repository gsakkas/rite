
let rec sumList xs = match xs with | [] -> [] | h::xs' -> h + (sumList xs');;


(* fix

let rec sumList xs = match xs with | [] -> 0 | h::t -> h + (sumList t);;

*)

(* changed spans
(2,21)-(2,75)
(2,43)-(2,45)
(2,71)-(2,74)
*)

(* type error slice
(2,3)-(2,77)
(2,16)-(2,75)
(2,21)-(2,75)
(2,21)-(2,75)
(2,43)-(2,45)
(2,58)-(2,75)
(2,58)-(2,75)
(2,62)-(2,75)
(2,63)-(2,70)
*)
