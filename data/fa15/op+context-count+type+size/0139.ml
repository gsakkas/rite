
let rec assoc (d,k,l) = match l with | h::t -> assoc d k t | _ -> d;;


(* fix

let rec assoc (d,k,l) = match l with | h::t -> assoc (d, k, t);;

*)

(* changed spans
(2,25)-(2,68)
(2,48)-(2,59)
(2,54)-(2,55)
(2,67)-(2,68)
*)

(* type error slice
(2,4)-(2,70)
(2,16)-(2,68)
(2,48)-(2,53)
(2,48)-(2,59)
(2,54)-(2,55)
*)
