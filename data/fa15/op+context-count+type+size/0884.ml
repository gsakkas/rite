
let rec digitsOfInt n =
  if n <= 0 then [] else (digitsOfInt (n / 10)) @ [n mod 10];;

let digits n = digitsOfInt (abs n);;

let rec digitalRoot n =
  match digits n with | x::[] -> x | h::t -> h + (digitalRoot t);;


(* fix

let rec digitsOfInt n =
  if n <= 0 then [] else (digitsOfInt (n / 10)) @ [n mod 10];;

let digits n = digitsOfInt (abs n);;

let rec sumList xs = match xs with | [] -> 0 | h::t -> h + (sumList t);;

let rec digitalRoot n =
  match digits n with | x::[] -> x | h::t -> h + (digitalRoot (sumList t));;

*)

(* changed spans
(7,20)-(8,64)
(8,8)-(8,14)
(8,15)-(8,16)
(8,45)-(8,46)
(8,49)-(8,64)
(8,50)-(8,61)
(8,62)-(8,63)
*)

(* type error slice
(5,3)-(5,36)
(5,11)-(5,34)
(5,27)-(5,34)
(5,28)-(5,31)
(5,32)-(5,33)
(7,3)-(8,66)
(7,20)-(8,64)
(8,2)-(8,64)
(8,2)-(8,64)
(8,8)-(8,14)
(8,8)-(8,16)
(8,15)-(8,16)
(8,49)-(8,64)
(8,50)-(8,61)
(8,62)-(8,63)
*)
