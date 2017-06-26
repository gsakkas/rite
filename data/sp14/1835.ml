
let rec digitsOfInt n =
  let rec append xs1 xs2 =
    match xs1 with | [] -> xs2 | hd::tl -> hd :: (append tl xs2) in
  let rec helper x =
    match x with | 0 -> [] | m -> append (helper (m / 10)) [m mod 10] in
  helper n;;

let digits n = digitsOfInt (abs n);;

let rec sumList xs = match xs with | [] -> 0 | hd::tl -> hd + (sumList tl);;

let rec additivePersistence n =
  let rec helper count x =
    match x with
    | [] -> count
    | hd::tl -> helper (count + 1) (sumList (digits n)) in
  helper 0;;


(* fix

let rec digitsOfInt n =
  let rec append xs1 xs2 =
    match xs1 with | [] -> xs2 | hd::tl -> hd :: (append tl xs2) in
  let rec helper x =
    match x with | 0 -> [] | m -> append (helper (m / 10)) [m mod 10] in
  helper n;;

let digits n = digitsOfInt (abs n);;

let rec sumList xs = match xs with | [] -> 0 | hd::tl -> hd + (sumList tl);;

let rec additivePersistence n =
  let rec helper count x =
    if x < 10 then count else helper (count + 1) (sumList (digits n)) in
  helper 0 n;;

*)

(* changed spans
(15,4)-(17,55)
(15,10)-(15,11)
(16,12)-(16,17)
(18,2)-(18,10)
*)

(* type error slice
(11,57)-(11,74)
(11,62)-(11,74)
(11,63)-(11,70)
(14,2)-(18,10)
(14,17)-(17,55)
(14,23)-(17,55)
(15,4)-(17,55)
(15,10)-(15,11)
(17,16)-(17,22)
(17,16)-(17,55)
(17,35)-(17,55)
(17,36)-(17,43)
*)

(* all spans
(2,20)-(7,10)
(3,2)-(7,10)
(3,17)-(4,64)
(3,21)-(4,64)
(4,4)-(4,64)
(4,10)-(4,13)
(4,27)-(4,30)
(4,43)-(4,64)
(4,43)-(4,45)
(4,49)-(4,64)
(4,50)-(4,56)
(4,57)-(4,59)
(4,60)-(4,63)
(5,2)-(7,10)
(5,17)-(6,69)
(6,4)-(6,69)
(6,10)-(6,11)
(6,24)-(6,26)
(6,34)-(6,69)
(6,34)-(6,40)
(6,41)-(6,58)
(6,42)-(6,48)
(6,49)-(6,57)
(6,50)-(6,51)
(6,54)-(6,56)
(6,59)-(6,69)
(6,60)-(6,68)
(6,60)-(6,61)
(6,66)-(6,68)
(7,2)-(7,10)
(7,2)-(7,8)
(7,9)-(7,10)
(9,11)-(9,34)
(9,15)-(9,34)
(9,15)-(9,26)
(9,27)-(9,34)
(9,28)-(9,31)
(9,32)-(9,33)
(11,16)-(11,74)
(11,21)-(11,74)
(11,27)-(11,29)
(11,43)-(11,44)
(11,57)-(11,74)
(11,57)-(11,59)
(11,62)-(11,74)
(11,63)-(11,70)
(11,71)-(11,73)
(13,28)-(18,10)
(14,2)-(18,10)
(14,17)-(17,55)
(14,23)-(17,55)
(15,4)-(17,55)
(15,10)-(15,11)
(16,12)-(16,17)
(17,16)-(17,55)
(17,16)-(17,22)
(17,23)-(17,34)
(17,24)-(17,29)
(17,32)-(17,33)
(17,35)-(17,55)
(17,36)-(17,43)
(17,44)-(17,54)
(17,45)-(17,51)
(17,52)-(17,53)
(18,2)-(18,10)
(18,2)-(18,8)
(18,9)-(18,10)
*)
