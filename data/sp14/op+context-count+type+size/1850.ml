
let rec cat x y = match x with | [] -> [y] | h::t -> h :: (cat t y);;

let rec listReverse l =
  match l with | [] -> [] | h::t -> listReverse ((cat l h) :: t);;


(* fix

let rec cat x y = match x with | [] -> [y] | h::t -> h :: (cat t y);;

let rec listReverse l =
  match l with | [] -> [] | h::t -> listReverse (cat l h);;

*)

(* changed spans
(5,48)-(5,64)
(5,62)-(5,63)
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
(5,2)-(5,64)
(5,2)-(5,64)
(5,48)-(5,64)
(5,48)-(5,64)
(5,49)-(5,58)
(5,50)-(5,53)
(5,56)-(5,57)
(5,62)-(5,63)
*)
