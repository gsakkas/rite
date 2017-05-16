
let rec myAppend l n = match l with | [] -> [n] | h::t -> h :: (myAppend t n);;

let rec getDigits n =
  match n with | 0 -> [] | _ -> myAppend (getDigits (n / 10)) (n mod 10);;

let rec digitsOfInt n = if n = 0 then [0] else getDigits n;;

let digits n = digitsOfInt (abs n);;

let rec sumList xs = match xs with | [] -> 0 | h::t -> h + (sumList t);;

let rec additivePersistence n =
  match n with | 0 -> 1 | _ -> 1 + (additivePersistence (sumList digits n));;


(* fix

let rec myAppend l n = match l with | [] -> [n] | h::t -> h :: (myAppend t n);;

let rec getDigits n =
  match n with | 0 -> [] | _ -> myAppend (getDigits (n / 10)) (n mod 10);;

let rec digitsOfInt n = if n = 0 then [0] else getDigits n;;

let digits n = digitsOfInt (abs n);;

let rec sumList xs = match xs with | [] -> 0 | h::t -> h + (sumList t);;

let rec additivePersistence n =
  match n with | 0 -> 1 | _ -> 1 + (additivePersistence (sumList (digits n)));;

*)

(* changed spans
(14,56)-(14,74)
(14,65)-(14,71)
*)

(* type error slice
(11,55)-(11,70)
(11,59)-(11,70)
(11,60)-(11,67)
(14,56)-(14,74)
(14,57)-(14,64)
*)

(* all spans
(2,17)-(2,77)
(2,19)-(2,77)
(2,23)-(2,77)
(2,29)-(2,30)
(2,44)-(2,47)
(2,45)-(2,46)
(2,58)-(2,77)
(2,58)-(2,59)
(2,63)-(2,77)
(2,64)-(2,72)
(2,73)-(2,74)
(2,75)-(2,76)
(4,18)-(5,72)
(5,2)-(5,72)
(5,8)-(5,9)
(5,22)-(5,24)
(5,32)-(5,72)
(5,32)-(5,40)
(5,41)-(5,61)
(5,42)-(5,51)
(5,52)-(5,60)
(5,53)-(5,54)
(5,57)-(5,59)
(5,62)-(5,72)
(5,63)-(5,64)
(5,69)-(5,71)
(7,20)-(7,58)
(7,24)-(7,58)
(7,27)-(7,32)
(7,27)-(7,28)
(7,31)-(7,32)
(7,38)-(7,41)
(7,39)-(7,40)
(7,47)-(7,58)
(7,47)-(7,56)
(7,57)-(7,58)
(9,11)-(9,34)
(9,15)-(9,34)
(9,15)-(9,26)
(9,27)-(9,34)
(9,28)-(9,31)
(9,32)-(9,33)
(11,16)-(11,70)
(11,21)-(11,70)
(11,27)-(11,29)
(11,43)-(11,44)
(11,55)-(11,70)
(11,55)-(11,56)
(11,59)-(11,70)
(11,60)-(11,67)
(11,68)-(11,69)
(13,28)-(14,75)
(14,2)-(14,75)
(14,8)-(14,9)
(14,22)-(14,23)
(14,31)-(14,75)
(14,31)-(14,32)
(14,35)-(14,75)
(14,36)-(14,55)
(14,56)-(14,74)
(14,57)-(14,64)
(14,65)-(14,71)
(14,72)-(14,73)
*)
