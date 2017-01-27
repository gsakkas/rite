
let rec cat x y = match x with | [] -> [y] | h::t -> h :: (cat t y);;

let rec listReverse l =
  match l with | [] -> [] | h::t -> listReverse (t :: (cat l h));;


(* fix

let rec cat x y = match x with | [] -> [y] | h::t -> h :: (cat t y);;

let rec listReverse l =
  match l with | [] -> [] | h::t -> listReverse (cat l h);;

*)

(* changed spans
(5,50)-(5,51)
(5,50)-(5,63)
*)

(* type error slice
(2,19)-(2,67)
(2,60)-(2,63)
(2,60)-(2,67)
(2,64)-(2,65)
(2,66)-(2,67)
(4,4)-(5,67)
(4,21)-(5,63)
(5,3)-(5,63)
(5,24)-(5,26)
(5,37)-(5,48)
(5,37)-(5,63)
(5,50)-(5,51)
(5,50)-(5,63)
(5,56)-(5,59)
(5,56)-(5,63)
(5,60)-(5,61)
(5,62)-(5,63)
*)
