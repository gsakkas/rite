
let rec sumList xs = match xs with | [] -> 0 | h::t -> h + t;;


(* fix

let rec sumList xs = match xs with | [] -> 0;;

*)

(* changed spans
(2,21)-(2,60)
(2,55)-(2,60)
*)

(* type error slice
(2,21)-(2,60)
(2,21)-(2,60)
(2,55)-(2,60)
(2,59)-(2,60)
*)

(* all spans
(2,16)-(2,60)
(2,21)-(2,60)
(2,27)-(2,29)
(2,43)-(2,44)
(2,55)-(2,60)
(2,55)-(2,56)
(2,59)-(2,60)
*)
