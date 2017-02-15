
let rec append list1 list2 = match list1 with | [] -> [] | h::t -> h :: list2;;

let rec listReverse l =
  match l with | [] -> [] | h::[] -> l | h::t -> listReverse (append (t [h]));;


(* fix

let rec append list1 list2 = match list1 with | [] -> [] | h::t -> h :: list2;;

let rec listReverse l =
  match l with | [] -> [] | h::[] -> l | h::t -> listReverse (append t [h]);;

*)

(* changed spans
(5,61)-(5,77)
(5,69)-(5,76)
*)

(* type error slice
(2,3)-(2,79)
(2,15)-(2,77)
(2,21)-(2,77)
(4,3)-(5,79)
(4,20)-(5,77)
(5,2)-(5,77)
(5,2)-(5,77)
(5,2)-(5,77)
(5,2)-(5,77)
(5,8)-(5,9)
(5,49)-(5,60)
(5,49)-(5,77)
(5,61)-(5,77)
(5,62)-(5,68)
(5,69)-(5,76)
(5,70)-(5,71)
*)
