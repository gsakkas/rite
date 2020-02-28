
let rec cat x y = match x with | [] -> [y] | h::t -> h :: (cat t y);;

let rec listReverse l =
  match l with | [] -> [] | h::t -> listReverse ((cat l h) :: t);;


(* fix

let rec cat x y = match x with | [] -> [y] | h::t -> h :: (cat t y);;

let rec listReverse l =
  match l with | [] -> [] | h::t -> listReverse (cat l h);;

*)

(* changed spans
(5,49)-(5,65)
cat l h
AppG [VarG,VarG]

*)

(* type error slice
(2,19)-(2,68)
(2,40)-(2,43)
(2,41)-(2,42)
(2,54)-(2,68)
(2,59)-(2,68)
(2,60)-(2,63)
(2,66)-(2,67)
(5,3)-(5,65)
(5,49)-(5,65)
(5,50)-(5,59)
(5,51)-(5,54)
(5,57)-(5,58)
(5,63)-(5,64)
*)
