
let rec append list1 list2 =
  match list1 with | [] -> list2 | h::t -> h :: (append t list2);;

let rec listReverse l =
  match l with | [] -> [] | h::t -> append (listReverse t) [h];;

let rec digitsOfInt n =
  if n <= 0 then [] else listReverse ([n mod 10] append digitsOfInt (n / 10));;


(* fix

let rec append list1 list2 =
  match list1 with | [] -> list2 | h::t -> h :: (append t list2);;

let rec listReverse l =
  match l with | [] -> [] | h::t -> append (listReverse t) [h];;

let rec digitsOfInt n =
  if n <= 0
  then []
  else listReverse (append [n mod 10] (digitsOfInt (n / 10)));;

*)

(* changed spans
(9,37)-(9,77)
(9,38)-(9,48)
(9,49)-(9,55)
*)

(* type error slice
(9,37)-(9,77)
(9,38)-(9,48)
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
(5,20)-(6,62)
(6,2)-(6,62)
(6,8)-(6,9)
(6,23)-(6,25)
(6,36)-(6,62)
(6,36)-(6,42)
(6,43)-(6,58)
(6,44)-(6,55)
(6,56)-(6,57)
(6,59)-(6,62)
(6,60)-(6,61)
(8,20)-(9,77)
(9,2)-(9,77)
(9,5)-(9,11)
(9,5)-(9,6)
(9,10)-(9,11)
(9,17)-(9,19)
(9,25)-(9,77)
(9,25)-(9,36)
(9,37)-(9,77)
(9,38)-(9,48)
(9,39)-(9,47)
(9,39)-(9,40)
(9,45)-(9,47)
(9,49)-(9,55)
(9,56)-(9,67)
(9,68)-(9,76)
(9,69)-(9,70)
(9,73)-(9,75)
*)
