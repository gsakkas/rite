
let digitsOfInt n =
  let rec lastDigit n accu =
    if n <= 0 then accu else lastDigit (n / 10) ((n mod 10) :: accu) in
  match n with | _ -> lastDigit n [];;

let rec sumList xs = match xs with | [] -> 0 | hd::tl -> hd + (sumList tl);;

let rec additivePersistence n =
  match n with | 0 -> 0 | _ -> additivePersistence sumList digitsOfInt n;;


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
(10,31)-(10,72)
(10,51)-(10,58)
(10,59)-(10,70)
*)

(* type error slice
(9,3)-(10,74)
(9,28)-(10,72)
(10,2)-(10,72)
(10,31)-(10,50)
(10,31)-(10,72)
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
(7,16)-(7,74)
(7,21)-(7,74)
(7,27)-(7,29)
(7,43)-(7,44)
(7,57)-(7,74)
(7,57)-(7,59)
(7,62)-(7,74)
(7,63)-(7,70)
(7,71)-(7,73)
(9,28)-(10,72)
(10,2)-(10,72)
(10,8)-(10,9)
(10,22)-(10,23)
(10,31)-(10,72)
(10,31)-(10,50)
(10,51)-(10,58)
(10,59)-(10,70)
(10,71)-(10,72)
*)
