
let rec cat x y = match x with | [] -> [y] | h::t -> h :: (cat t y);;

let rec listReverse l =
  match l with | [] -> [] | h::t -> cat l (listReverse t h);;


(* fix

let rec cat x y = match x with | [] -> [y] | h::t -> h :: (cat t y);;

let rec listReverse l =
  match l with | [] -> [] | h::t -> cat (listReverse t) h;;

*)

(* changed spans
(5,41)-(5,42)
listReverse t
AppG [VarG]

(5,43)-(5,60)
h
VarG

*)

(* type error slice
(4,4)-(5,62)
(4,21)-(5,60)
(5,3)-(5,60)
(5,24)-(5,26)
(5,43)-(5,60)
(5,44)-(5,55)
*)
