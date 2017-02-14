
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
(2,17)-(2,70)
(2,22)-(2,70)
(2,28)-(2,30)
(2,44)-(2,45)
(2,56)-(2,57)
(2,56)-(2,70)
(2,61)-(2,68)
(2,61)-(2,70)
(2,69)-(2,70)
(4,32)-(4,34)
(4,40)-(4,41)
(4,47)-(4,58)
(4,47)-(4,69)
(4,60)-(4,67)
(4,60)-(4,69)
(4,68)-(4,69)
*)

(* type error slice
(2,22)-(2,70)
(2,22)-(2,70)
(2,61)-(2,68)
(2,61)-(2,70)
(2,69)-(2,70)
(4,28)-(4,29)
(4,28)-(4,34)
(4,28)-(4,34)
(4,32)-(4,34)
(4,60)-(4,67)
(4,60)-(4,69)
(4,68)-(4,69)
*)
