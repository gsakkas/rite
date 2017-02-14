
let rec digitsOfInt n =
  if n <= 0 then [] else (digitsOfInt (n / 10)) @ [n mod 10];;

let digits n = digitsOfInt (abs n);;

let rec sumList xs = match xs with | [] -> 0 | t::h -> t + (sumList h);;

let rec additivePersAndRoot num persCount =
  let absNum = abs num in
  if absNum < 10
  then (persCount, absNum)
  else
    (let xs = digits absNum in
     let theSum = sumList xs in additivePersAndRoot theSum (persCount + 1));;

let rec additivePersistence n = let (l,r) = additivePersAndRoot n in l;;


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
(9,29)-(15,74)
(10,3)-(15,74)
(10,16)-(10,19)
(10,16)-(10,23)
(10,20)-(10,23)
(14,6)-(15,74)
(15,6)-(15,74)
(17,33)-(17,71)
(17,45)-(17,64)
(17,45)-(17,66)
(17,65)-(17,66)
(17,70)-(17,71)
*)

(* type error slice
(15,33)-(15,52)
(15,33)-(15,74)
(17,33)-(17,71)
(17,45)-(17,64)
(17,45)-(17,66)
*)
