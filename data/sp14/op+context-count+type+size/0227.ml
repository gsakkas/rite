
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
(16,32)-(16,74)
(16,64)-(16,67)
(16,73)-(16,74)
*)

(* type error slice
(7,55)-(7,70)
(7,59)-(7,70)
(7,60)-(7,67)
(14,5)-(14,74)
(14,18)-(14,25)
(14,18)-(14,28)
(14,32)-(14,51)
(14,32)-(14,74)
(14,52)-(14,58)
(16,44)-(16,63)
(16,44)-(16,69)
(16,64)-(16,67)
*)
