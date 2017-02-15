
let rec assoc (d,k,l) = match l with | h::t -> assoc d k t;;


(* fix

let rec assoc (d,k,l) = match l with | h::t -> assoc (d, k, t);;

*)

(* changed spans
(2,47)-(2,58)
(2,53)-(2,54)
*)

(* type error slice
(2,3)-(2,60)
(2,15)-(2,58)
(2,47)-(2,52)
(2,47)-(2,58)
(2,53)-(2,54)
*)
