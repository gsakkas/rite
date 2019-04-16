
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
digitalRoot (sumDigits n)
AppG (fromList [AppG (fromList [EmptyG])])

*)

(* type error slice
(5,4)-(5,72)
(5,21)-(5,70)
(5,25)-(5,70)
(5,40)-(5,51)
(5,40)-(5,63)
(5,62)-(5,63)
(5,69)-(5,70)
*)
