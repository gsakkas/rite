
let rec listReverse l = match l with | [] -> l | h::t -> h;;


(* fix

let rec listReverse l = match l with | [] -> l | h::t -> [h];;

*)

(* changed spans
(2,57)-(2,58)
*)

(* type error slice
(2,24)-(2,58)
(2,30)-(2,31)
(2,45)-(2,46)
(2,57)-(2,58)
*)

(* all spans
(2,20)-(2,58)
(2,24)-(2,58)
(2,30)-(2,31)
(2,45)-(2,46)
(2,57)-(2,58)
*)
