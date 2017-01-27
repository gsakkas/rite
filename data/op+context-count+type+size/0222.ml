
let rec digitsOfInt n =
  if n <= 0 then [] else (digitsOfInt (n / 10)) @ [n mod 10];;

let digits n = digitsOfInt (abs n);;

let rec sumList xs = match xs with | [] -> 0 | t::h -> t + (sumList h);;

let rec additivePersAndRoot absNum persCount =
  if absNum < 10
  then (persCount, absNum)
  else
    (let xs = digits absNum in
     let theSum = sumList xs in additivePersAndRoot theSum (persCount + 1));;

let rec additivePersistence n = let (l,r) = additivePersAndRoot abs n in l;;


(* fix

let rec digitsOfInt n =
  if n <= 0 then [] else (digitsOfInt (n / 10)) @ [n mod 10];;

let digits n = digitsOfInt (abs n);;

let rec sumList xs = match xs with | [] -> 0 | t::h -> t + (sumList h);;

let rec additivePersAndRoot absNum persCount =
  if absNum < 10
  then (persCount, absNum)
  else
    (let xs = digits absNum in
     let theSum = sumList xs in additivePersAndRoot theSum (persCount + 1));;

let rec additivePersistence n =
  let (l,r) = additivePersAndRoot (abs n) 0 in l;;

*)

(* changed spans
(16,65)-(16,68)
(16,74)-(16,75)
*)

(* type error slice
(3,27)-(3,38)
(3,27)-(3,46)
(3,40)-(3,46)
(5,4)-(5,37)
(5,12)-(5,34)
(5,16)-(5,27)
(5,16)-(5,34)
(5,29)-(5,32)
(5,29)-(5,34)
(5,33)-(5,34)
(7,22)-(7,70)
(7,61)-(7,68)
(7,61)-(7,70)
(7,69)-(7,70)
(10,6)-(10,12)
(10,6)-(10,17)
(10,15)-(10,17)
(13,6)-(14,74)
(13,15)-(13,21)
(13,15)-(13,28)
(13,22)-(13,28)
(14,6)-(14,74)
(14,19)-(14,26)
(14,19)-(14,29)
(14,27)-(14,29)
(14,33)-(14,52)
(14,33)-(14,74)
(14,53)-(14,59)
(14,61)-(14,74)
(16,45)-(16,64)
(16,45)-(16,70)
(16,65)-(16,68)
(16,69)-(16,70)
*)
