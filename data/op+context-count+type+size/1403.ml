
let rec listReverse l =
  match l with | h::t -> h :: (l listReverse t) | [] -> l;;


(* fix

let rec listReverse l = match l with | [] -> l | h::t -> h :: (listReverse t);;

*)

(* changed spans
(3,3)-(3,58)
(3,26)-(3,47)
(3,32)-(3,33)
(3,32)-(3,47)
(3,57)-(3,58)
*)

(* type error slice
(2,4)-(3,60)
(2,21)-(3,58)
(3,3)-(3,58)
(3,9)-(3,10)
(3,26)-(3,47)
(3,32)-(3,33)
(3,32)-(3,47)
(3,34)-(3,45)
(3,46)-(3,47)
(3,57)-(3,58)
*)
