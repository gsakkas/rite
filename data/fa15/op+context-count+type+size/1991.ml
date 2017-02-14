
let rec sumList xs = match xs with | [] -> [] | h::xs' -> h + (sumList xs');;


(* fix

let rec sumList xs = match xs with | [] -> 0 | h::t -> h + (sumList t);;

*)

(* changed spans
(2,22)-(2,75)
(2,44)-(2,46)
(2,72)-(2,75)
*)

(* type error slice
(2,4)-(2,78)
(2,17)-(2,75)
(2,22)-(2,75)
(2,22)-(2,75)
(2,44)-(2,46)
(2,59)-(2,75)
(2,59)-(2,75)
(2,64)-(2,71)
(2,64)-(2,75)
*)
