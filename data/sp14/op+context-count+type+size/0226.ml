
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
(9,28)-(15,75)
(10,2)-(15,75)
(10,15)-(10,18)
(10,15)-(10,22)
(10,19)-(10,22)
(14,4)-(15,75)
(15,5)-(15,74)
(17,32)-(17,70)
(17,44)-(17,63)
(17,44)-(17,65)
(17,64)-(17,65)
(17,69)-(17,70)
*)

(* type error slice
(15,32)-(15,51)
(15,32)-(15,74)
(17,32)-(17,70)
(17,44)-(17,63)
(17,44)-(17,65)
*)
