
let rec append list1 list2 = match list1 with | [] -> [] | h::t -> h :: list2;;

let rec listReverse l =
  match l with | [] -> [] | h::[] -> l | h::t -> listReverse append (t [h]);;


(* fix

let rec append list1 list2 = match list1 with | [] -> [] | h::t -> h :: list2;;

let rec listReverse l =
  match l with | [] -> [] | h::[] -> l | h::t -> listReverse (append t [h]);;

*)

(* changed spans
(5,49)-(5,75)
(5,61)-(5,67)
(5,68)-(5,75)
*)

(* type error slice
(4,3)-(5,77)
(4,20)-(5,75)
(5,2)-(5,75)
(5,49)-(5,60)
(5,49)-(5,75)
(5,68)-(5,75)
(5,69)-(5,70)
*)

(* all spans
(2,15)-(2,77)
(2,21)-(2,77)
(2,29)-(2,77)
(2,35)-(2,40)
(2,54)-(2,56)
(2,67)-(2,77)
(2,67)-(2,68)
(2,72)-(2,77)
(4,20)-(5,75)
(5,2)-(5,75)
(5,8)-(5,9)
(5,23)-(5,25)
(5,37)-(5,38)
(5,49)-(5,75)
(5,49)-(5,60)
(5,61)-(5,67)
(5,68)-(5,75)
(5,69)-(5,70)
(5,71)-(5,74)
(5,72)-(5,73)
*)
