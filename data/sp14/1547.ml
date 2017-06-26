
let rec sumList xs = match xs with | [] -> 0 | h::t -> h + (sumList t);;

let rec digitalRoot n =
  let rec digHelper n = if n < 10 then n else digHelper (sumList n) in
  digHelper n;;


(* fix

let digitsOfInt n =
  let rec digitsHelper n l =
    if n = 0 then l else digitsHelper (n / 10) ((n mod 10) :: l) in
  if n <= 0 then [] else digitsHelper n [];;

let rec sumList xs = match xs with | [] -> 0 | h::t -> h + (sumList t);;

let rec digitalRoot n =
  let rec digHelper n =
    if n < 10 then n else digHelper (sumList (digitsOfInt n)) in
  digHelper n;;

*)

(* changed spans
(2,16)-(2,70)
(5,65)-(5,66)
*)

(* type error slice
(2,21)-(2,70)
(2,59)-(2,70)
(2,60)-(2,67)
(2,68)-(2,69)
(5,27)-(5,28)
(5,27)-(5,33)
(5,31)-(5,33)
(5,56)-(5,67)
(5,57)-(5,64)
(5,65)-(5,66)
*)

(* all spans
(2,16)-(2,70)
(2,21)-(2,70)
(2,27)-(2,29)
(2,43)-(2,44)
(2,55)-(2,70)
(2,55)-(2,56)
(2,59)-(2,70)
(2,60)-(2,67)
(2,68)-(2,69)
(4,20)-(6,13)
(5,2)-(6,13)
(5,20)-(5,67)
(5,24)-(5,67)
(5,27)-(5,33)
(5,27)-(5,28)
(5,31)-(5,33)
(5,39)-(5,40)
(5,46)-(5,67)
(5,46)-(5,55)
(5,56)-(5,67)
(5,57)-(5,64)
(5,65)-(5,66)
(6,2)-(6,13)
(6,2)-(6,11)
(6,12)-(6,13)
*)
