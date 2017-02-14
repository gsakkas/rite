
let rec listReverse l = function | [] -> l | h::t -> listReverse (h :: l);;


(* fix

let rec listReverse l = match l with | [] -> l | (_::tail::[])::[] -> l;;

*)

(* changed spans
(2,25)-(2,73)
(2,54)-(2,73)
*)

(* type error slice
(2,4)-(2,76)
(2,21)-(2,73)
(2,25)-(2,73)
(2,25)-(2,73)
(2,54)-(2,65)
(2,54)-(2,73)
*)
