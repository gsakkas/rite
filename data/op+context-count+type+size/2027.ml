
let rec cat x y = match x with | [] -> [y] | h::t -> h :: (cat t y);;

let rec listReverse l =
  match l with | [] -> [] | h::t -> listReverse ((cat l h) :: t);;


(* fix

let rec cat x y = match x with | [] -> [y] | h::t -> h :: (cat t y);;

let rec listReverse l =
  match l with | [] -> [] | h::t -> listReverse (cat l h);;

*)

(* changed spans
(5,51)-(5,64)
(5,63)-(5,64)
*)

(* type error slice
(2,19)-(2,67)
(2,60)-(2,63)
(2,60)-(2,67)
(2,64)-(2,65)
(2,66)-(2,67)
(4,4)-(5,67)
(4,21)-(5,64)
(5,3)-(5,64)
(5,24)-(5,26)
(5,37)-(5,48)
(5,37)-(5,64)
(5,51)-(5,54)
(5,51)-(5,58)
(5,51)-(5,64)
(5,55)-(5,56)
(5,57)-(5,58)
(5,63)-(5,64)
*)
