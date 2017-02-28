
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
(7,16)-(7,70)
(7,21)-(7,70)
(7,27)-(7,29)
(7,43)-(7,44)
(7,55)-(7,56)
(7,55)-(7,70)
(7,59)-(7,70)
(7,68)-(7,69)
*)

(* type error slice
(5,3)-(5,36)
(5,11)-(5,34)
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
(10,2)-(10,77)
(10,2)-(10,77)
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

(* all spans
(2,20)-(3,60)
(3,2)-(3,60)
(3,5)-(3,11)
(3,5)-(3,6)
(3,10)-(3,11)
(3,17)-(3,19)
(3,25)-(3,60)
(3,48)-(3,49)
(3,25)-(3,47)
(3,26)-(3,37)
(3,38)-(3,46)
(3,39)-(3,40)
(3,43)-(3,45)
(3,50)-(3,60)
(3,51)-(3,59)
(3,51)-(3,52)
(3,57)-(3,59)
(5,11)-(5,34)
(5,15)-(5,34)
(5,15)-(5,26)
(5,27)-(5,34)
(5,28)-(5,31)
(5,32)-(5,33)
(7,16)-(7,70)
(7,21)-(7,70)
(7,27)-(7,29)
(7,43)-(7,44)
(7,55)-(7,70)
(7,55)-(7,56)
(7,59)-(7,70)
(7,60)-(7,67)
(7,68)-(7,69)
(9,20)-(10,77)
(10,2)-(10,77)
(10,8)-(10,16)
(10,8)-(10,14)
(10,15)-(10,16)
(10,33)-(10,34)
(10,45)-(10,77)
(10,45)-(10,56)
(10,57)-(10,77)
(10,58)-(10,64)
(10,65)-(10,76)
(10,66)-(10,73)
(10,74)-(10,75)
*)
