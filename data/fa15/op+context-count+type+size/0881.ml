
let rec digitsOfInt n =
  if n <= 0 then [] else (digitsOfInt (n / 10)) @ [n mod 10];;

let digits n = digitsOfInt (abs n);;

let rec digitalRoot n =
  match n with | x::[] -> x | h::t -> h + (digitalRoot (digits t));;


(* fix

let rec digitsOfInt n =
  if n <= 0 then [] else (digitsOfInt (n / 10)) @ [n mod 10];;

let digits n = digitsOfInt (abs n);;

let rec sumList xs = match xs with | [] -> 0 | h::t -> h + (sumList t);;

let rec digitalRoot n =
  match digits n with | x::[] -> x | h::t -> h + (digitalRoot (sumList t));;

*)

(* changed spans
(7,20)-(8,66)
(8,2)-(8,66)
(8,8)-(8,9)
(8,26)-(8,27)
(8,38)-(8,66)
(8,43)-(8,54)
(8,55)-(8,65)
(8,56)-(8,62)
*)

(* type error slice
(5,3)-(5,36)
(5,11)-(5,34)
(5,27)-(5,34)
(5,28)-(5,31)
(5,32)-(5,33)
(8,2)-(8,66)
(8,2)-(8,66)
(8,55)-(8,65)
(8,56)-(8,62)
(8,63)-(8,64)
*)
