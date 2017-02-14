
let rec listReverse l =
  match l with | [] -> [l] | h::t -> h :: (listReverse t);;


(* fix

let rec listReverse l =
  match l with | h::t -> h :: (listReverse t) | [] -> [];;

*)

(* changed spans
(3,3)-(3,57)
(3,9)-(3,10)
(3,24)-(3,27)
*)

(* type error slice
(3,3)-(3,57)
(3,3)-(3,57)
(3,3)-(3,57)
(3,3)-(3,57)
(3,9)-(3,10)
(3,24)-(3,27)
(3,24)-(3,27)
(3,25)-(3,26)
(3,38)-(3,39)
(3,38)-(3,57)
(3,38)-(3,57)
*)
