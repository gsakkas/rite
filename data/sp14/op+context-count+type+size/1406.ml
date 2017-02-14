
let rec listReverse l =
  match l with | [] -> [l] | h::t -> h :: (listReverse t);;


(* fix

let rec listReverse l =
  match l with | h::t -> h :: (listReverse t) | [] -> [];;

*)

(* changed spans
(3,2)-(3,57)
(3,8)-(3,9)
(3,23)-(3,26)
*)

(* type error slice
(3,2)-(3,57)
(3,2)-(3,57)
(3,2)-(3,57)
(3,2)-(3,57)
(3,8)-(3,9)
(3,23)-(3,26)
(3,23)-(3,26)
(3,24)-(3,25)
(3,37)-(3,38)
(3,37)-(3,57)
(3,37)-(3,57)
*)
