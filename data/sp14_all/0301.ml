
let rec listReverse l =
  match l with | [] -> [] | h::t -> h :: (listReverse (listReverse h));;


(* fix

let rec listReverse l =
  match l with | [] -> [] | h::t -> h :: (listReverse (listReverse l));;

*)

(* changed spans
(3,68)-(3,69)
l
VarG

*)

(* type error slice
(3,37)-(3,38)
(3,37)-(3,71)
(3,42)-(3,71)
(3,43)-(3,54)
(3,55)-(3,70)
(3,56)-(3,67)
(3,68)-(3,69)
*)
