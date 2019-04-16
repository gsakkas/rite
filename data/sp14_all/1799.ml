
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
abs n
AppG (fromList [VarG])

(16,69)-(16,70)
0
LitG

*)

(* type error slice
(7,56)-(7,71)
(7,60)-(7,71)
(7,61)-(7,68)
(14,6)-(14,75)
(14,19)-(14,26)
(14,19)-(14,29)
(14,33)-(14,52)
(14,33)-(14,75)
(14,53)-(14,59)
(16,45)-(16,64)
(16,45)-(16,70)
(16,65)-(16,68)
*)
