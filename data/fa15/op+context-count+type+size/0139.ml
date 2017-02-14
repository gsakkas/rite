
let rec assoc (d,k,l) = match l with | h::t -> assoc d k t | _ -> d;;


(* fix

let rec assoc (d,k,l) = match l with | h::t -> assoc (d, k, t);;

*)

(* changed spans
(2,24)-(2,67)
(2,47)-(2,58)
(2,53)-(2,54)
(2,66)-(2,67)
*)

(* type error slice
(2,3)-(2,69)
(2,15)-(2,67)
(2,47)-(2,52)
(2,47)-(2,58)
(2,53)-(2,54)
*)
