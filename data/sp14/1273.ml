
let digitsOfInt n =
  let rec lastDigit n acc =
    if n <= 0 then acc else lastDigit (n / 10) ((n mod 10) :: acc) in
  match n with | _ -> lastDigit n [];;

let rec sumList xs = match xs with | [] -> 0 | hd::tl -> hd + (sumList tl);;

let rec additivePersistence n count =
  match n with
  | [] -> count
  | _ -> additivePersistence (sumList (digitsOfInt n) (count + 1));;


(* fix

let digitsOfInt n =
  let rec lastDigit n accu =
    if n <= 0 then accu else lastDigit (n / 10) ((n mod 10) :: accu) in
  match n with | _ -> lastDigit n [];;

let rec sumList xs = match xs with | [] -> 0 | hd::tl -> hd + (sumList tl);;

let rec additivePersistence n =
  match n with | 0 -> 0 | _ -> additivePersistence (sumList (digitsOfInt n));;

*)

(* changed spans
(3,22)-(4,66)
(4,19)-(4,22)
(4,62)-(4,65)
(9,30)-(12,66)
(10,2)-(12,66)
(11,10)-(11,15)
(12,29)-(12,66)
(12,54)-(12,65)
(12,55)-(12,60)
(12,63)-(12,64)
*)

(* type error slice
(2,3)-(5,38)
(2,16)-(5,36)
(4,28)-(4,37)
(4,28)-(4,66)
(4,38)-(4,46)
(5,22)-(5,31)
(5,22)-(5,36)
(5,32)-(5,33)
(7,57)-(7,74)
(7,62)-(7,74)
(7,63)-(7,70)
(9,3)-(12,68)
(9,28)-(12,66)
(9,30)-(12,66)
(10,2)-(12,66)
(10,8)-(10,9)
(11,10)-(11,15)
(12,9)-(12,28)
(12,9)-(12,66)
(12,29)-(12,66)
(12,30)-(12,37)
(12,38)-(12,53)
(12,39)-(12,50)
(12,51)-(12,52)
*)

(* all spans
(2,16)-(5,36)
(3,2)-(5,36)
(3,20)-(4,66)
(3,22)-(4,66)
(4,4)-(4,66)
(4,7)-(4,13)
(4,7)-(4,8)
(4,12)-(4,13)
(4,19)-(4,22)
(4,28)-(4,66)
(4,28)-(4,37)
(4,38)-(4,46)
(4,39)-(4,40)
(4,43)-(4,45)
(4,47)-(4,66)
(4,48)-(4,58)
(4,49)-(4,50)
(4,55)-(4,57)
(4,62)-(4,65)
(5,2)-(5,36)
(5,8)-(5,9)
(5,22)-(5,36)
(5,22)-(5,31)
(5,32)-(5,33)
(5,34)-(5,36)
(7,16)-(7,74)
(7,21)-(7,74)
(7,27)-(7,29)
(7,43)-(7,44)
(7,57)-(7,74)
(7,57)-(7,59)
(7,62)-(7,74)
(7,63)-(7,70)
(7,71)-(7,73)
(9,28)-(12,66)
(9,30)-(12,66)
(10,2)-(12,66)
(10,8)-(10,9)
(11,10)-(11,15)
(12,9)-(12,66)
(12,9)-(12,28)
(12,29)-(12,66)
(12,30)-(12,37)
(12,38)-(12,53)
(12,39)-(12,50)
(12,51)-(12,52)
(12,54)-(12,65)
(12,55)-(12,60)
(12,63)-(12,64)
*)
