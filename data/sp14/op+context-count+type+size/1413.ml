
let rec append l1 l2 = match l1 with | [] -> l2 | h::t -> h :: (append t l2);;

let rec listReverse l =
  match l with | [] -> [] | h::t -> append (listReverse t; [h]);;


(* fix

let rec append l1 l2 = match l1 with | [] -> l2 | h::t -> h :: (append t l2);;

let rec listReverse l = match l with | [] -> [] | h::t -> append [h] [h];;

*)

(* changed spans
(5,37)-(5,63)
(5,45)-(5,56)
(5,45)-(5,58)
(5,45)-(5,63)
(5,57)-(5,58)
*)

(* type error slice
(2,65)-(2,71)
(2,65)-(2,76)
(4,4)-(5,66)
(4,21)-(5,63)
(5,3)-(5,63)
(5,3)-(5,63)
(5,24)-(5,26)
(5,37)-(5,43)
(5,37)-(5,63)
(5,45)-(5,56)
(5,45)-(5,58)
(5,45)-(5,63)
*)
