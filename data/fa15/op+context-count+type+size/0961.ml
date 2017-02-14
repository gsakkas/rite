
let rec digitsOfInt n =
  if n <= 0 then [] else (digitsOfInt (n / 10)) @ [n mod 10];;

let digits n = digitsOfInt (abs n);;

let rec sumList xs = match xs with | [] -> 0 | h::t -> h + (sumList t);;

let rec digitalRoot n =
  match digits n with | [] -> 0 | h::t -> digitalRoot (digits (sumList n));;


(* fix

let rec digitsOfInt n =
  if n <= 0 then [] else (digitsOfInt (n / 10)) @ [n mod 10];;

let digits n = digitsOfInt (abs n);;

let rec digitalRoot n = match digits n with | x::[] -> x;;

*)

(* changed spans
(7,17)-(7,70)
(7,22)-(7,70)
(7,28)-(7,30)
(7,44)-(7,45)
(7,56)-(7,57)
(7,56)-(7,70)
(7,61)-(7,70)
*)

(* type error slice
(3,27)-(3,38)
(3,27)-(3,46)
(3,27)-(3,61)
(3,49)-(3,50)
(5,4)-(5,37)
(5,12)-(5,34)
(5,16)-(5,27)
(5,16)-(5,34)
(5,29)-(5,32)
(5,29)-(5,34)
(5,33)-(5,34)
(7,22)-(7,70)
(7,22)-(7,70)
(7,56)-(7,70)
(7,61)-(7,68)
(7,61)-(7,70)
(7,69)-(7,70)
(9,4)-(10,77)
(9,21)-(10,73)
(10,9)-(10,15)
(10,9)-(10,17)
(10,16)-(10,17)
(10,43)-(10,54)
(10,43)-(10,73)
(10,56)-(10,62)
(10,56)-(10,73)
(10,64)-(10,71)
(10,64)-(10,73)
(10,72)-(10,73)
*)
