
let rec listReverse l =
  match l with | [] -> l | h::t -> listReverse (h :: l) t;;


(* fix

let rec listReverse l = match l with | [] -> l | h::t -> listReverse (h :: l);;

*)

(* changed spans
(3,35)-(3,57)
(3,56)-(3,57)
*)

(* type error slice
(2,3)-(3,59)
(2,20)-(3,57)
(3,2)-(3,57)
(3,35)-(3,46)
(3,35)-(3,57)
*)

(* all spans
(2,20)-(3,57)
(3,2)-(3,57)
(3,8)-(3,9)
(3,23)-(3,24)
(3,35)-(3,57)
(3,35)-(3,46)
(3,47)-(3,55)
(3,48)-(3,49)
(3,53)-(3,54)
(3,56)-(3,57)
*)
