
let rec sumList xs = match xs with | [] -> 0 | x::y -> x + (sumList y);;

let rec digitalRoot n = if n < 10 then n else digitalRoot (sumList n);;


(* fix

let rec digitsOfInt n =
  if n < 0
  then []
  else if n < 10 then [n] else (digitsOfInt (n / 10)) @ [n mod 10];;

let rec sumList xs = match xs with | [] -> 0 | x::y -> x + (sumList y);;

let rec digitalRoot n =
  if n < 10 then n else digitalRoot (sumList (digitsOfInt n));;

*)

(* changed spans
(2,16)-(2,70)
(2,21)-(2,70)
(2,27)-(2,29)
(2,43)-(2,44)
(2,55)-(2,56)
(2,55)-(2,70)
(2,59)-(2,70)
(2,60)-(2,67)
(2,68)-(2,69)
(4,31)-(4,33)
(4,39)-(4,40)
(4,46)-(4,57)
(4,46)-(4,69)
(4,58)-(4,69)
(4,59)-(4,66)
(4,67)-(4,68)
*)

(* type error slice
(2,21)-(2,70)
(2,21)-(2,70)
(2,59)-(2,70)
(2,60)-(2,67)
(2,68)-(2,69)
(4,27)-(4,28)
(4,27)-(4,33)
(4,27)-(4,33)
(4,31)-(4,33)
(4,58)-(4,69)
(4,59)-(4,66)
(4,67)-(4,68)
*)
