
let rec digitsOfInt n =
  if n > 0 then (digitsOfInt (n / 10)) @ [n mod 10] else [];;

let rec sumList xs = match xs with | [] -> 0 | h::t -> h + (sumList t);;

let rec digitalRoot n =
  let sum = 0 in
  if n < 10 then n + sum else sum = (digitalRoot (sumList (digitsOfInt n)));;


(* fix

let rec digitsOfInt n =
  if n > 0 then (digitsOfInt (n / 10)) @ [n mod 10] else [];;

let rec sumList xs = match xs with | [] -> 0 | h::t -> h + (sumList t);;

let rec digitalRoot n =
  let sum = 0 in if n < 10 then n else digitalRoot (sumList (digitsOfInt n));;

*)

(* changed spans
(9,17)-(9,24)
(9,21)-(9,24)
(9,30)-(9,33)
(9,30)-(9,75)
*)

(* type error slice
(9,2)-(9,75)
(9,17)-(9,24)
(9,30)-(9,75)
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
(7,20)-(9,75)
(8,2)-(9,75)
(8,12)-(8,13)
(9,2)-(9,75)
(9,5)-(9,11)
(9,5)-(9,6)
(9,9)-(9,11)
(9,17)-(9,24)
(9,17)-(9,18)
(9,21)-(9,24)
(9,30)-(9,75)
(9,30)-(9,33)
(9,36)-(9,75)
(9,37)-(9,48)
(9,49)-(9,74)
(9,50)-(9,57)
(9,58)-(9,73)
(9,59)-(9,70)
(9,71)-(9,72)
*)
