
let rec cat x y = match x with | [] -> [y] | h::t -> h :: (cat t y);;

let rec listReverse l =
  match l with | [] -> [] | h::t -> listReverse (t :: (cat l h));;


(* fix

let rec cat x y = match x with | [] -> [y] | h::t -> h :: (cat t y);;

let rec listReverse l =
  match l with | [] -> [] | h::t -> listReverse (cat l h);;

*)

(* changed spans
(5,48)-(5,64)
(5,49)-(5,50)
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
(5,49)-(5,50)
(5,54)-(5,63)
(5,55)-(5,58)
(5,61)-(5,62)
*)
