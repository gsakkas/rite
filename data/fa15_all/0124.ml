
let rec listReverse l =
  match l with | [] -> [] | t -> t | h::t -> [h] @ (listReverse [t]);;


(* fix

let rec listReverse l =
  match l with | [] -> [] | t -> t | h::t -> t @ (listReverse [h]);;

*)

(* changed spans
(3,46)-(3,49)
t
VarG

(3,66)-(3,67)
h
VarG

*)

(* type error slice
(2,4)-(3,71)
(2,21)-(3,69)
(3,3)-(3,69)
(3,9)-(3,10)
(3,52)-(3,69)
(3,53)-(3,64)
(3,65)-(3,68)
(3,66)-(3,67)
*)
