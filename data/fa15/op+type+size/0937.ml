
let rec add current next =
  match current with | [] -> [next] | front::back -> front :: (add back next);;

let rec digitsOfInt n =
  if n <= 0 then [] else add (digitsOfInt (n / 10)) (n mod 10);;

let digits n = digitsOfInt (abs n);;

let rec sumList xs = match xs with | [] -> 0 | xf::xb -> xf + (sumList xb);;

let rec additivePersistence n =
  let x = sumList digits n in
  if x > 9 then 1 + (additivePersistence x) else 1;;


(* fix

let rec add current next =
  match current with | [] -> [next] | front::back -> front :: (add back next);;

let rec digitsOfInt n =
  if n <= 0 then [] else add (digitsOfInt (n / 10)) (n mod 10);;

let digits n = digitsOfInt (abs n);;

let rec sumList xs = match xs with | [] -> 0 | xf::xb -> xf + (sumList xb);;

let rec additivePersistence n =
  let x = sumList (digits n) in
  if x > 9 then 1 + (additivePersistence x) else 1;;

*)

(* changed spans
(13,10)-(13,26)
(13,18)-(13,24)
*)

(* type error slice
(10,57)-(10,74)
(10,62)-(10,74)
(10,63)-(10,70)
(13,10)-(13,17)
(13,10)-(13,26)
*)

(* all spans
(2,12)-(3,77)
(2,20)-(3,77)
(3,2)-(3,77)
(3,8)-(3,15)
(3,29)-(3,35)
(3,30)-(3,34)
(3,53)-(3,77)
(3,53)-(3,58)
(3,62)-(3,77)
(3,63)-(3,66)
(3,67)-(3,71)
(3,72)-(3,76)
(5,20)-(6,62)
(6,2)-(6,62)
(6,5)-(6,11)
(6,5)-(6,6)
(6,10)-(6,11)
(6,17)-(6,19)
(6,25)-(6,62)
(6,25)-(6,28)
(6,29)-(6,51)
(6,30)-(6,41)
(6,42)-(6,50)
(6,43)-(6,44)
(6,47)-(6,49)
(6,52)-(6,62)
(6,53)-(6,54)
(6,59)-(6,61)
(8,11)-(8,34)
(8,15)-(8,34)
(8,15)-(8,26)
(8,27)-(8,34)
(8,28)-(8,31)
(8,32)-(8,33)
(10,16)-(10,74)
(10,21)-(10,74)
(10,27)-(10,29)
(10,43)-(10,44)
(10,57)-(10,74)
(10,57)-(10,59)
(10,62)-(10,74)
(10,63)-(10,70)
(10,71)-(10,73)
(12,28)-(14,50)
(13,2)-(14,50)
(13,10)-(13,26)
(13,10)-(13,17)
(13,18)-(13,24)
(13,25)-(13,26)
(14,2)-(14,50)
(14,5)-(14,10)
(14,5)-(14,6)
(14,9)-(14,10)
(14,16)-(14,43)
(14,16)-(14,17)
(14,20)-(14,43)
(14,21)-(14,40)
(14,41)-(14,42)
(14,49)-(14,50)
*)
