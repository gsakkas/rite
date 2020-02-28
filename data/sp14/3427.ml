
let rec listReverse l =
  match l with | [] -> [] | x::l -> (listReverse l) :: x;;


(* fix

let rec listReverse l =
  match l with | [] -> [] | x::l -> x :: (listReverse l);;

*)

(* changed spans
(3,37)-(3,52)
x
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
