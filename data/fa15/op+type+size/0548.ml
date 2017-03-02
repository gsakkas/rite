
let rec digitsOfInt n =
  if n > 0 then (digitsOfInt (n / 10)) @ [n mod 10] else [];;

let rec sumList xs = match xs with | [] -> 0 | h::t -> h + (sumList t);;

let rec additivePersistence n =
  if (sumList (digitsOfInt n)) > 10 then 1 + additivePersistence else 0;;


(* fix

let rec digitsOfInt n =
  if n > 0 then (digitsOfInt (n / 10)) @ [n mod 10] else [];;

let digits n = digitsOfInt (abs n);;

let rec sumList xs = match xs with | [] -> 0 | h::t -> h + (sumList t);;

let rec additivePersistence n =
  let x = sumList (digits n) in
  if x > 10 then 1 + (additivePersistence x) else 0;;

*)

(* changed spans
(5,16)-(5,70)
(8,2)-(8,71)
(8,5)-(8,35)
(8,15)-(8,26)
(8,33)-(8,35)
(8,45)-(8,64)
(8,70)-(8,71)
*)

(* type error slice
(7,3)-(8,73)
(7,28)-(8,71)
(8,41)-(8,64)
(8,45)-(8,64)
*)

(* all spans
(2,20)-(3,59)
(3,2)-(3,59)
(3,5)-(3,10)
(3,5)-(3,6)
(3,9)-(3,10)
(3,16)-(3,51)
(3,39)-(3,40)
(3,16)-(3,38)
(3,17)-(3,28)
(3,29)-(3,37)
(3,30)-(3,31)
(3,34)-(3,36)
(3,41)-(3,51)
(3,42)-(3,50)
(3,42)-(3,43)
(3,48)-(3,50)
(3,57)-(3,59)
(5,16)-(5,70)
(5,21)-(5,70)
(5,27)-(5,29)
(5,43)-(5,44)
(5,55)-(5,70)
(5,55)-(5,56)
(5,59)-(5,70)
(5,60)-(5,67)
(5,68)-(5,69)
(7,28)-(8,71)
(8,2)-(8,71)
(8,5)-(8,35)
(8,5)-(8,30)
(8,6)-(8,13)
(8,14)-(8,29)
(8,15)-(8,26)
(8,27)-(8,28)
(8,33)-(8,35)
(8,41)-(8,64)
(8,41)-(8,42)
(8,45)-(8,64)
(8,70)-(8,71)
*)
