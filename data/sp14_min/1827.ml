
let rec append list1 list2 =
  match list1 with | [] -> list2 | h::t -> h :: (append t list2);;

let rec listReverse l =
  match l with | [] -> [] | h::t -> append (listReverse t) [h];;

let rec digitsOfInt n =
  if n <= 0 then [] else listReverse (append [n mod 10] digitsOfInt (n / 10));;


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
(9,38)-(9,78)
append [n mod 10]
       (digitsOfInt (n / 10))
AppG [ListG [EmptyG],AppG [EmptyG]]

*)

(* type error slice
(6,3)-(6,63)
(6,24)-(6,26)
(6,37)-(6,43)
(6,37)-(6,63)
(6,60)-(6,63)
(8,4)-(9,80)
(8,21)-(9,78)
(9,38)-(9,78)
(9,39)-(9,45)
(9,57)-(9,68)
*)
