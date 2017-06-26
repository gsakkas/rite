
let rec listReverse l = match l with | h::t -> listReverse h | [] -> [];;


(* fix

let rec listReverse l = match l with | h::t -> listReverse [h] | [] -> [];;

*)

(* changed spans
(2,59)-(2,60)
*)

(* type error slice
(2,3)-(2,73)
(2,20)-(2,71)
(2,24)-(2,71)
(2,30)-(2,31)
(2,47)-(2,58)
(2,47)-(2,60)
(2,59)-(2,60)
*)

(* all spans
(2,20)-(2,71)
(2,24)-(2,71)
(2,30)-(2,31)
(2,47)-(2,60)
(2,47)-(2,58)
(2,59)-(2,60)
(2,69)-(2,71)
*)
