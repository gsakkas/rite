
let rec listReverse l = match l with | [] -> l | h::t -> h;;


(* fix

let rec listReverse l = match l with | [] -> l | h::t -> [h];;

*)

(* changed spans
(2,58)-(2,59)
*)

(* type error slice
(2,25)-(2,59)
(2,46)-(2,47)
(2,58)-(2,59)
*)
