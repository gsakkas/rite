
let rec listReverse l = function | [] -> l | h::t -> listReverse (h :: l);;


(* fix

let rec listReverse l = match l with | [] -> l | (_::tail::[])::[] -> l;;

*)

(* changed spans
(2,24)-(2,73)
(2,53)-(2,73)
*)

(* type error slice
(2,3)-(2,75)
(2,20)-(2,73)
(2,24)-(2,73)
(2,24)-(2,73)
(2,53)-(2,64)
(2,53)-(2,73)
*)
