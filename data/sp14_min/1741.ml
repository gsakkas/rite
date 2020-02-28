
let rec listReverse l =
  match l with | [] -> [] | h::t -> (listReverse t) :: h;;


(* fix

let rec listReverse l =
  match l with | [] -> [] | h::t -> h :: (listReverse l);;

*)

(* changed spans
(3,37)-(3,52)
h
VarG

(3,56)-(3,57)
listReverse l
AppG [VarG]

*)

(* type error slice
(2,4)-(3,59)
(2,21)-(3,57)
(3,3)-(3,57)
(3,37)-(3,52)
(3,37)-(3,57)
(3,38)-(3,49)
*)
