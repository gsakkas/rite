
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
