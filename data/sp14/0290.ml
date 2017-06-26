
let rec listReverse l = match l with | [] -> [] | h::t -> [listReverse t; h];;


(* fix

let rec listReverse l = match l with | [] -> l | h::t -> listReverse (h :: l);;

*)

(* changed spans
(2,45)-(2,47)
(2,58)-(2,76)
(2,71)-(2,72)
*)

(* type error slice
(2,3)-(2,78)
(2,20)-(2,76)
(2,24)-(2,76)
(2,58)-(2,76)
(2,59)-(2,70)
(2,59)-(2,72)
*)

(* all spans
(2,20)-(2,76)
(2,24)-(2,76)
(2,30)-(2,31)
(2,45)-(2,47)
(2,58)-(2,76)
(2,59)-(2,72)
(2,59)-(2,70)
(2,71)-(2,72)
(2,74)-(2,75)
*)
