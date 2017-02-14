
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
(7,21)-(8,65)
(8,3)-(8,65)
(8,9)-(8,10)
(8,27)-(8,28)
(8,39)-(8,65)
(8,44)-(8,55)
(8,57)-(8,63)
(8,57)-(8,65)
*)

(* type error slice
(5,4)-(5,37)
(5,12)-(5,34)
(5,29)-(5,32)
(5,29)-(5,34)
(5,33)-(5,34)
(8,3)-(8,65)
(8,3)-(8,65)
(8,57)-(8,63)
(8,57)-(8,65)
(8,64)-(8,65)
*)
