
let rec listReverse l =
  match l with | [] -> [] | h -> [h] | h::t -> t @ (listReverse h);;


(* fix

let rec listReverse l =
  match l with | [] -> [] | h -> h | h::t -> t @ (listReverse [h]);;

*)

(* changed spans
(3,34)-(3,37)
h
VarG

(3,65)-(3,66)
[h]
ListG [VarG]

*)

(* type error slice
(3,3)-(3,67)
(3,34)-(3,37)
(3,35)-(3,36)
(3,48)-(3,49)
(3,48)-(3,67)
(3,50)-(3,51)
*)
