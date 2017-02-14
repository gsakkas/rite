
let rec digitsOfInt n =
  if n <= 0 then [] else (digitsOfInt (n / 10)) @ [n mod 10];;

let digits n = digitsOfInt (abs n);;

let rec sumList xs = match xs with | [] -> 0 | h::t -> h + (sumList t);;

let rec digitalRoot n =
  match digits n with | x::[] -> 0 | h::t -> digitalRoot (digits (sumList n));;


(* fix

let rec digitsOfInt n =
  if n <= 0 then [] else (digitsOfInt (n / 10)) @ [n mod 10];;

let digits n = digitsOfInt (abs n);;

let rec digitalRoot n = match digits n with | x::[] -> x;;

*)

(* changed spans
(7,16)-(7,70)
(7,21)-(7,70)
(7,27)-(7,29)
(7,43)-(7,44)
(7,55)-(7,56)
(7,55)-(7,70)
(7,59)-(7,70)
*)

(* type error slice
(3,25)-(3,47)
(3,25)-(3,60)
(3,26)-(3,37)
(3,48)-(3,49)
(5,3)-(5,36)
(5,11)-(5,34)
(5,15)-(5,26)
(5,15)-(5,34)
(5,27)-(5,34)
(5,28)-(5,31)
(5,32)-(5,33)
(7,21)-(7,70)
(7,21)-(7,70)
(7,55)-(7,70)
(7,59)-(7,70)
(7,60)-(7,67)
(7,68)-(7,69)
(9,3)-(10,79)
(9,20)-(10,77)
(10,8)-(10,14)
(10,8)-(10,16)
(10,15)-(10,16)
(10,45)-(10,56)
(10,45)-(10,77)
(10,57)-(10,77)
(10,58)-(10,64)
(10,65)-(10,76)
(10,66)-(10,73)
(10,74)-(10,75)
*)
