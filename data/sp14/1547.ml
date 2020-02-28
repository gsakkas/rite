
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
(5,66)-(5,67)
digitsOfInt n
AppG [VarG]

*)

(* type error slice
(2,22)-(2,71)
(2,60)-(2,71)
(2,61)-(2,68)
(2,69)-(2,70)
(5,28)-(5,29)
(5,28)-(5,34)
(5,32)-(5,34)
(5,57)-(5,68)
(5,58)-(5,65)
(5,66)-(5,67)
*)
