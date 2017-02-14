
let rec digitsOfInt n =
  if n <= 0 then [] else (digitsOfInt (n / 10)) @ [n mod 10];;

let digits n = digitsOfInt (abs n);;

let rec sumList xs = match xs with | [] -> 0 | h::t -> h + (sumList t);;

let rec digitalRoot n =
  match digits n with | [] -> 0 | h::t -> digitalRoot (sumList n);;


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
(5,3)-(5,36)
(5,11)-(5,34)
(5,27)-(5,34)
(5,28)-(5,31)
(5,32)-(5,33)
(7,21)-(7,70)
(7,21)-(7,70)
(7,59)-(7,70)
(7,60)-(7,67)
(7,68)-(7,69)
(10,8)-(10,14)
(10,8)-(10,16)
(10,15)-(10,16)
(10,54)-(10,65)
(10,55)-(10,62)
(10,63)-(10,64)
*)
