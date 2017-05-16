
let rec sumDigits n1 =
  if n1 < 10 then n1 else (n1 mod 10) + (sumDigits (n1 / 10));;

let rec digitalRoot n = if n > 10 then digitalRoot sumDigits n else n;;


(* fix

let rec sumDigits n1 =
  if n1 < 10 then n1 else (n1 mod 10) + (sumDigits (n1 / 10));;

let rec digitalRoot n = if n > 10 then digitalRoot (sumDigits n) else n;;

*)

(* changed spans
(5,39)-(5,62)
(5,51)-(5,60)
*)

(* type error slice
(5,3)-(5,71)
(5,20)-(5,69)
(5,24)-(5,69)
(5,39)-(5,50)
(5,39)-(5,62)
(5,61)-(5,62)
(5,68)-(5,69)
*)

(* all spans
(2,18)-(3,61)
(3,2)-(3,61)
(3,5)-(3,12)
(3,5)-(3,7)
(3,10)-(3,12)
(3,18)-(3,20)
(3,26)-(3,61)
(3,26)-(3,37)
(3,27)-(3,29)
(3,34)-(3,36)
(3,40)-(3,61)
(3,41)-(3,50)
(3,51)-(3,60)
(3,52)-(3,54)
(3,57)-(3,59)
(5,20)-(5,69)
(5,24)-(5,69)
(5,27)-(5,33)
(5,27)-(5,28)
(5,31)-(5,33)
(5,39)-(5,62)
(5,39)-(5,50)
(5,51)-(5,60)
(5,61)-(5,62)
(5,68)-(5,69)
*)
