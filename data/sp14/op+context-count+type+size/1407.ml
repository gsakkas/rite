
let rec listReverse l =
  match l with | h::t -> h :: (l listReverse t) | [] -> l;;


(* fix

let rec listReverse l = match l with | [] -> l | h::t -> h :: (listReverse t);;

*)

(* changed spans
(3,2)-(3,57)
(3,25)-(3,47)
(3,30)-(3,47)
(3,31)-(3,32)
(3,56)-(3,57)
*)

(* type error slice
(3,2)-(3,57)
(3,2)-(3,57)
(3,2)-(3,57)
(3,2)-(3,57)
(3,2)-(3,57)
(3,2)-(3,57)
(3,8)-(3,9)
(3,25)-(3,47)
(3,30)-(3,47)
(3,31)-(3,32)
(3,56)-(3,57)
*)
