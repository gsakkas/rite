
let rec helperAppend l n =
  match l with | [] -> n | h::t -> h :: (helperAppend t n);;

let rec digitsOfInt n =
  if n <= 0 then [] else helperAppend (digitsOfInt (n / 10)) [n mod 10];;

let rec sumList xs = match xs with | [] -> 0 | h::t -> h + (sumList t);;

let rec additivePersistence n =
  if n <= 0 then [] else sumList (digitsOfInt n);;


(* fix

let rec helperAppend l n =
  match l with | [] -> n | h::t -> h :: (helperAppend t n);;

let rec digitsOfInt n =
  if n <= 0 then [] else helperAppend (digitsOfInt (n / 10)) [n mod 10];;

let rec sumList xs = match xs with | [] -> 0 | h::t -> h + (sumList t);;

let rec additivePersistence n = if n < 10 then 0 else sumList (digitsOfInt n);;

*)

(* changed spans
(11,5)-(11,11)
(11,10)-(11,11)
(11,17)-(11,19)
*)

(* type error slice
(8,55)-(8,70)
(8,59)-(8,70)
(8,60)-(8,67)
(11,2)-(11,48)
(11,17)-(11,19)
(11,25)-(11,32)
(11,25)-(11,48)
*)

(* all spans
(2,21)-(3,58)
(2,23)-(3,58)
(3,2)-(3,58)
(3,8)-(3,9)
(3,23)-(3,24)
(3,35)-(3,58)
(3,35)-(3,36)
(3,40)-(3,58)
(3,41)-(3,53)
(3,54)-(3,55)
(3,56)-(3,57)
(5,20)-(6,71)
(6,2)-(6,71)
(6,5)-(6,11)
(6,5)-(6,6)
(6,10)-(6,11)
(6,17)-(6,19)
(6,25)-(6,71)
(6,25)-(6,37)
(6,38)-(6,60)
(6,39)-(6,50)
(6,51)-(6,59)
(6,52)-(6,53)
(6,56)-(6,58)
(6,61)-(6,71)
(6,62)-(6,70)
(6,62)-(6,63)
(6,68)-(6,70)
(8,16)-(8,70)
(8,21)-(8,70)
(8,27)-(8,29)
(8,43)-(8,44)
(8,55)-(8,70)
(8,55)-(8,56)
(8,59)-(8,70)
(8,60)-(8,67)
(8,68)-(8,69)
(10,28)-(11,48)
(11,2)-(11,48)
(11,5)-(11,11)
(11,5)-(11,6)
(11,10)-(11,11)
(11,17)-(11,19)
(11,25)-(11,48)
(11,25)-(11,32)
(11,33)-(11,48)
(11,34)-(11,45)
(11,46)-(11,47)
*)
