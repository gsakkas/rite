
let rec digits (x,y) =
  if y < 10 then y :: x else digits (((y mod 10) :: x), (y mod 10));;

let rec digitsOfInt n = if n <= 0 then [] else digits ([], n);;

let digits n = digitsOfInt (abs n);;

let rec digitsOfInt n = if n <= 0 then [] else digits ([], n);;


(* fix

let rec digits (x,y) =
  if y < 10 then y :: x else digits (((y mod 10) :: x), (y / 10));;

let rec digitsOfInt n = if n <= 0 then [] else digits ([], n);;

*)

(* changed spans
(3,58)-(3,66)
(7,12)-(7,34)
(9,21)-(9,61)
*)

(* type error slice
(5,4)-(5,64)
(5,21)-(5,61)
(5,25)-(5,61)
(5,28)-(5,29)
(5,28)-(5,34)
(5,33)-(5,34)
(5,40)-(5,42)
(7,4)-(7,37)
(7,12)-(7,34)
(7,16)-(7,27)
(7,16)-(7,34)
(7,29)-(7,32)
(7,29)-(7,34)
(7,33)-(7,34)
(9,28)-(9,29)
(9,28)-(9,34)
(9,33)-(9,34)
(9,48)-(9,54)
(9,48)-(9,61)
(9,56)-(9,58)
(9,56)-(9,61)
(9,60)-(9,61)
*)
