
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
(2,17)-(2,70)
(2,22)-(2,70)
(2,28)-(2,30)
(2,44)-(2,45)
(2,56)-(2,57)
(2,56)-(2,70)
(2,61)-(2,68)
(2,61)-(2,70)
(2,69)-(2,70)
(5,25)-(5,67)
(5,28)-(5,34)
(5,32)-(5,34)
(5,40)-(5,41)
(5,47)-(5,56)
(5,47)-(5,67)
(5,58)-(5,65)
(5,58)-(5,67)
(5,66)-(5,67)
(6,3)-(6,12)
(6,3)-(6,14)
(6,13)-(6,14)
*)

(* type error slice
(2,22)-(2,70)
(2,61)-(2,68)
(2,61)-(2,70)
(2,69)-(2,70)
(5,28)-(5,29)
(5,28)-(5,34)
(5,32)-(5,34)
(5,58)-(5,65)
(5,58)-(5,67)
(5,66)-(5,67)
*)
