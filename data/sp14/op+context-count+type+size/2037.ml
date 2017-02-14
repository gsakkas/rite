
let rec cat x y = match x with | [] -> [y] | h::t -> h :: (cat t y);;

let rec listReverse l = match l with | [] -> [] | h::t -> (cat l h) :: t;;


(* fix

let rec cat x y = match x with | [] -> [y] | h::t -> h :: (cat t y);;

let rec listReverse l =
  match l with | [] -> [] | h::t -> listReverse (cat l h);;

*)

(* changed spans
(4,58)-(4,67)
(4,58)-(4,72)
(4,71)-(4,72)
*)

(* type error slice
(2,18)-(2,67)
(2,18)-(2,67)
(2,39)-(2,42)
(2,39)-(2,42)
(2,40)-(2,41)
(2,53)-(2,67)
(2,53)-(2,67)
(2,58)-(2,67)
(2,59)-(2,62)
(2,65)-(2,66)
(4,24)-(4,72)
(4,24)-(4,72)
(4,58)-(4,67)
(4,58)-(4,72)
(4,58)-(4,72)
(4,59)-(4,62)
(4,65)-(4,66)
(4,71)-(4,72)
*)
