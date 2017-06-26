
let digitsOfInt n =
  let rec lastDigit n accu =
    if n <= 0 then accu else lastDigit (n / 10) ((n mod 10) :: accu) in
  match n with | _ -> lastDigit n [];;

let rec lengthOfList xs count =
  match xs with | [] -> 0 | hd::tl -> (lengthOfList tl count) + 1;;

let rec sumList xs = match xs with | [] -> 0 | hd::tl -> hd + (sumList tl);;

let rec additivePersistence n =
  match n with
  | 0 -> 0
  | _ ->
      if not ((lengthOfList digitsOfInt n) = 1)
      then additivePersistence (sumList (digitsOfInt n))
      else 4;;


(* fix

let digitsOfInt n =
  let rec lastDigit n accu =
    if n <= 0 then accu else lastDigit (n / 10) ((n mod 10) :: accu) in
  match n with | _ -> lastDigit n [];;

let rec lengthOfList xs count =
  match xs with | [] -> 0 | hd::tl -> (lengthOfList tl count) + 1;;

let rec sumList xs = match xs with | [] -> 0 | hd::tl -> hd + (sumList tl);;

let rec additivePersistence n =
  match n with
  | 0 -> 0
  | _ ->
      if not ((lengthOfList (digitsOfInt n) 0) = 1)
      then additivePersistence (sumList (digitsOfInt n))
      else 4;;

*)

(* changed spans
(16,28)-(16,39)
(16,45)-(16,46)
*)

(* type error slice
(2,3)-(5,38)
(2,16)-(5,36)
(8,2)-(8,65)
(8,38)-(8,61)
(8,39)-(8,51)
(8,52)-(8,54)
(16,14)-(16,42)
(16,15)-(16,27)
(16,28)-(16,39)
*)

(* all spans
(2,16)-(5,36)
(3,2)-(5,36)
(3,20)-(4,68)
(3,22)-(4,68)
(4,4)-(4,68)
(4,7)-(4,13)
(4,7)-(4,8)
(4,12)-(4,13)
(4,19)-(4,23)
(4,29)-(4,68)
(4,29)-(4,38)
(4,39)-(4,47)
(4,40)-(4,41)
(4,44)-(4,46)
(4,48)-(4,68)
(4,49)-(4,59)
(4,50)-(4,51)
(4,56)-(4,58)
(4,63)-(4,67)
(5,2)-(5,36)
(5,8)-(5,9)
(5,22)-(5,36)
(5,22)-(5,31)
(5,32)-(5,33)
(5,34)-(5,36)
(7,21)-(8,65)
(7,24)-(8,65)
(8,2)-(8,65)
(8,8)-(8,10)
(8,24)-(8,25)
(8,38)-(8,65)
(8,38)-(8,61)
(8,39)-(8,51)
(8,52)-(8,54)
(8,55)-(8,60)
(8,64)-(8,65)
(10,16)-(10,74)
(10,21)-(10,74)
(10,27)-(10,29)
(10,43)-(10,44)
(10,57)-(10,74)
(10,57)-(10,59)
(10,62)-(10,74)
(10,63)-(10,70)
(10,71)-(10,73)
(12,28)-(18,12)
(13,2)-(18,12)
(13,8)-(13,9)
(14,9)-(14,10)
(16,6)-(18,12)
(16,9)-(16,47)
(16,9)-(16,12)
(16,13)-(16,47)
(16,14)-(16,42)
(16,15)-(16,27)
(16,28)-(16,39)
(16,40)-(16,41)
(16,45)-(16,46)
(17,11)-(17,56)
(17,11)-(17,30)
(17,31)-(17,56)
(17,32)-(17,39)
(17,40)-(17,55)
(17,41)-(17,52)
(17,53)-(17,54)
(18,11)-(18,12)
*)
