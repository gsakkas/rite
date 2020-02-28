
let rec cat x y = match x with | [] -> [y] | h::t -> h :: (cat t y);;

let rec listReverse l =
  match l with | [] -> [] | h::t -> cat h (listReverse t);;


(* fix

let rec cat x y = match x with | [] -> [y] | h::t -> h :: (cat t y);;

let rec listReverse l =
  match l with | [] -> [] | h::t -> cat (listReverse t) h;;

*)

(* changed spans
(5,41)-(5,42)
listReverse t
AppG [VarG]

(5,43)-(5,58)
h
VarG

*)

(* type error slice
(2,19)-(2,68)
(2,40)-(2,43)
(2,41)-(2,42)
(2,54)-(2,68)
(2,59)-(2,68)
(2,60)-(2,63)
(2,66)-(2,67)
(4,4)-(5,60)
(4,21)-(5,58)
(5,3)-(5,58)
(5,37)-(5,40)
(5,37)-(5,58)
(5,43)-(5,58)
(5,44)-(5,55)
*)
