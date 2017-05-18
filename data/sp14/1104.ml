
let rec appendLists (l1,l2) =
  match l1 with | [] -> l2 | h::t -> h :: (appendLists (t, l2));;

let rec digitsOfInt n =
  match n <= 0 with
  | true  -> []
  | false  -> appendLists ((digitsOfInt (n / 10)), [n mod 10]);;

let rec arrayLen l = match l with | [] -> 0 | h::t -> 1 + (arrayLen t);;

let rec digitSum dl = match dl with | [] -> 0 | h::t -> h + (digitSum t);;

let digits n = digitsOfInt (abs n);;

let rec additivePersistence n =
  match (arrayLen (digits n)) = 1 with
  | true  -> 0
  | false  -> 1 + (additivePersistence digitSum (digits n));;


(* fix

let rec appendLists (l1,l2) =
  match l1 with | [] -> l2 | h::t -> h :: (appendLists (t, l2));;

let rec digitsOfInt n =
  match n <= 0 with
  | true  -> []
  | false  -> appendLists ((digitsOfInt (n / 10)), [n mod 10]);;

let rec arrayLen l = match l with | [] -> 0 | h::t -> 1 + (arrayLen t);;

let rec digitSum dl = match dl with | [] -> 0 | h::t -> h + (digitSum t);;

let digits n = digitsOfInt (abs n);;

let rec additivePersistence n =
  match (arrayLen (digits n)) = 1 with
  | true  -> 0
  | false  -> 1 + (additivePersistence (digitSum (digits n)));;

*)

(* changed spans
(19,18)-(19,59)
(19,39)-(19,47)
*)

(* type error slice
(16,3)-(19,61)
(16,28)-(19,59)
(17,2)-(19,59)
(18,13)-(18,14)
(19,18)-(19,59)
(19,19)-(19,38)
*)

(* all spans
(2,21)-(3,63)
(3,2)-(3,63)
(3,8)-(3,10)
(3,24)-(3,26)
(3,37)-(3,63)
(3,37)-(3,38)
(3,42)-(3,63)
(3,43)-(3,54)
(3,55)-(3,62)
(3,56)-(3,57)
(3,59)-(3,61)
(5,20)-(8,62)
(6,2)-(8,62)
(6,8)-(6,14)
(6,8)-(6,9)
(6,13)-(6,14)
(7,13)-(7,15)
(8,14)-(8,62)
(8,14)-(8,25)
(8,26)-(8,62)
(8,27)-(8,49)
(8,28)-(8,39)
(8,40)-(8,48)
(8,41)-(8,42)
(8,45)-(8,47)
(8,51)-(8,61)
(8,52)-(8,60)
(8,52)-(8,53)
(8,58)-(8,60)
(10,17)-(10,70)
(10,21)-(10,70)
(10,27)-(10,28)
(10,42)-(10,43)
(10,54)-(10,70)
(10,54)-(10,55)
(10,58)-(10,70)
(10,59)-(10,67)
(10,68)-(10,69)
(12,17)-(12,72)
(12,22)-(12,72)
(12,28)-(12,30)
(12,44)-(12,45)
(12,56)-(12,72)
(12,56)-(12,57)
(12,60)-(12,72)
(12,61)-(12,69)
(12,70)-(12,71)
(14,11)-(14,34)
(14,15)-(14,34)
(14,15)-(14,26)
(14,27)-(14,34)
(14,28)-(14,31)
(14,32)-(14,33)
(16,28)-(19,59)
(17,2)-(19,59)
(17,8)-(17,33)
(17,8)-(17,29)
(17,9)-(17,17)
(17,18)-(17,28)
(17,19)-(17,25)
(17,26)-(17,27)
(17,32)-(17,33)
(18,13)-(18,14)
(19,14)-(19,59)
(19,14)-(19,15)
(19,18)-(19,59)
(19,19)-(19,38)
(19,39)-(19,47)
(19,48)-(19,58)
(19,49)-(19,55)
(19,56)-(19,57)
*)
