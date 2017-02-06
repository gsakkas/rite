
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
(15,5)-(17,54)
(15,11)-(15,12)
(16,13)-(16,18)
(18,3)-(18,11)
*)

(* type error slice
(2,4)-(7,13)
(2,21)-(7,11)
(3,3)-(7,11)
(3,18)-(4,64)
(3,22)-(4,64)
(4,5)-(4,64)
(4,5)-(4,64)
(4,5)-(4,64)
(4,5)-(4,64)
(4,5)-(4,64)
(4,5)-(4,64)
(4,5)-(4,64)
(4,11)-(4,14)
(4,28)-(4,31)
(4,44)-(4,46)
(4,44)-(4,64)
(4,51)-(4,57)
(4,51)-(4,64)
(4,51)-(4,64)
(4,51)-(4,64)
(4,58)-(4,60)
(4,61)-(4,64)
(5,18)-(6,70)
(6,5)-(6,70)
(6,11)-(6,12)
(6,25)-(6,27)
(6,35)-(6,41)
(6,35)-(6,70)
(6,35)-(6,70)
(6,43)-(6,49)
(6,43)-(6,57)
(6,51)-(6,52)
(7,10)-(7,11)
(9,4)-(9,37)
(9,12)-(9,34)
(9,16)-(9,27)
(9,16)-(9,34)
(9,33)-(9,34)
(11,17)-(11,74)
(11,22)-(11,74)
(11,22)-(11,74)
(11,22)-(11,74)
(11,22)-(11,74)
(11,28)-(11,30)
(11,58)-(11,60)
(11,64)-(11,71)
(11,64)-(11,74)
(11,64)-(11,74)
(11,72)-(11,74)
(13,4)-(18,13)
(13,29)-(18,11)
(14,18)-(17,54)
(14,24)-(17,54)
(15,5)-(17,54)
(15,5)-(17,54)
(15,5)-(17,54)
(15,5)-(17,54)
(15,5)-(17,54)
(15,11)-(15,12)
(16,13)-(16,18)
(17,17)-(17,23)
(17,17)-(17,54)
(17,25)-(17,30)
(17,46)-(17,52)
(17,46)-(17,54)
(17,53)-(17,54)
*)
