
let rec sumDigits n1 =
  if n1 < 10 then n1 else (n1 mod 10) + (sumDigits (n1 / 10));;

let rec digitalRoot n = if n > 10 then digitalRoot sumDigits n else n;;


(* fix

let rec sumDigits n1 =
  if n1 < 10 then n1 else (n1 mod 10) + (sumDigits (n1 / 10));;

let rec digitalRoot n = if n > 10 then digitalRoot (sumDigits n) else n;;

*)

(* changed spans
(5,40)-(5,63)
(5,52)-(5,61)
*)

(* type error slice
(3,42)-(3,51)
(3,42)-(3,60)
(3,53)-(3,60)
(5,4)-(5,72)
(5,21)-(5,70)
(5,25)-(5,70)
(5,28)-(5,29)
(5,28)-(5,34)
(5,32)-(5,34)
(5,40)-(5,51)
(5,40)-(5,63)
(5,52)-(5,61)
(5,62)-(5,63)
*)
