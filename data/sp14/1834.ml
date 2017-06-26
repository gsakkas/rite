
let rec append list1 list2 =
  match list1 with | [] -> list2 | h::t -> h :: (append t list2);;

let rec listReverse l = match l with | [] -> [] | h::t -> append (t [h]);;


(* fix

let rec append list1 list2 =
  match list1 with | [] -> list2 | h::t -> h :: (append t list2);;

let rec listReverse l = match l with | [] -> [] | h::t -> append t [h];;

*)

(* changed spans
(5,58)-(5,72)
(5,65)-(5,72)
*)

(* type error slice
(3,48)-(3,64)
(3,49)-(3,55)
(5,24)-(5,72)
(5,45)-(5,47)
(5,58)-(5,64)
(5,58)-(5,72)
(5,65)-(5,72)
(5,66)-(5,67)
*)

(* all spans
(2,15)-(3,64)
(2,21)-(3,64)
(3,2)-(3,64)
(3,8)-(3,13)
(3,27)-(3,32)
(3,43)-(3,64)
(3,43)-(3,44)
(3,48)-(3,64)
(3,49)-(3,55)
(3,56)-(3,57)
(3,58)-(3,63)
(5,20)-(5,72)
(5,24)-(5,72)
(5,30)-(5,31)
(5,45)-(5,47)
(5,58)-(5,72)
(5,58)-(5,64)
(5,65)-(5,72)
(5,66)-(5,67)
(5,68)-(5,71)
(5,69)-(5,70)
*)
