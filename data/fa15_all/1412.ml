
let rec digitsOfInt n =
  if n <= 0 then [] else (digitsOfInt (n / 10)) @ [n mod 10];;

let digits n = digitsOfInt (abs n);;

let rec sumList xs = match xs with | [] -> 0 | h::t -> h + (sumList t);;

let rec digitalRoot n =
  match digits n with | x::[] -> x | h::t -> digitalRoot (digits (sumList n));;


(* fix

let rec digitsOfInt n =
  if n <= 0 then [] else (digitsOfInt (n / 10)) @ [n mod 10];;

let digits n = digitsOfInt (abs n);;

let rec digitalRoot n = match digits n with | x::[] -> x;;

*)

(* changed spans
(10,3)-(10,78)
match digits n with
| x :: [] -> x
CaseG (AppG (fromList [EmptyG])) (fromList [(ConsPatG VarPatG (ConPatG Nothing),Nothing,VarG)])

*)

(* type error slice
(5,4)-(5,37)
(5,12)-(5,35)
(5,28)-(5,35)
(5,29)-(5,32)
(5,33)-(5,34)
(7,22)-(7,71)
(7,56)-(7,71)
(7,60)-(7,71)
(7,61)-(7,68)
(7,69)-(7,70)
(9,4)-(10,80)
(9,21)-(10,78)
(10,3)-(10,78)
(10,9)-(10,15)
(10,9)-(10,17)
(10,16)-(10,17)
(10,46)-(10,57)
(10,46)-(10,78)
(10,58)-(10,78)
(10,59)-(10,65)
(10,66)-(10,77)
(10,67)-(10,74)
(10,75)-(10,76)
*)
