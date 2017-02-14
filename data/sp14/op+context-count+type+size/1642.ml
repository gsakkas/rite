
let rec listReverse l =
  match l with | [] -> [] | h1::[] -> [h1] | h::t -> t :: (listReverse t);;


(* fix

let rec listReverse l =
  match l with | [] -> [] | h1::[] -> [h1] | h::t -> h :: (listReverse t);;

*)

(* changed spans
(3,53)-(3,54)
*)

(* type error slice
(3,2)-(3,73)
(3,2)-(3,73)
(3,2)-(3,73)
(3,2)-(3,73)
(3,2)-(3,73)
(3,2)-(3,73)
(3,38)-(3,42)
(3,38)-(3,42)
(3,39)-(3,41)
(3,53)-(3,54)
(3,53)-(3,73)
(3,53)-(3,73)
*)
