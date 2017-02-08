
let rec listReverse l =
  match l with | h::t -> h :: (l listReverse t) | [] -> [];;


(* fix

let rec listReverse l = match l with | [] -> l | h::t -> h :: (listReverse t);;

*)

(* changed spans
(3,3)-(3,59)
(3,26)-(3,47)
(3,32)-(3,33)
(3,32)-(3,47)
(3,57)-(3,59)
*)

(* type error slice
(3,3)-(3,59)
(3,3)-(3,59)
(3,3)-(3,59)
(3,3)-(3,59)
(3,9)-(3,10)
(3,32)-(3,33)
(3,32)-(3,47)
*)
