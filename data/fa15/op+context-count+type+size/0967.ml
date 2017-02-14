
let rec digitsOfInt n =
  if n <= 0 then [] else (digitsOfInt (n / 10)) @ [n mod 10];;

let digits n = digitsOfInt (abs n);;

let rec sumList xs = match xs with | [] -> 0 | h::t -> h + (sumList t);;

let rec digitalRoot n =
  match digits n with | x::[] -> x | h::t -> t + (digitalRoot (sumList h));;


(* fix

let rec digitsOfInt n =
  if n <= 0 then [] else (digitsOfInt (n / 10)) @ [n mod 10];;

let digits n = digitsOfInt (abs n);;

let rec sumList xs = match xs with | [] -> 0 | h::t -> h + (sumList t);;

let rec digitalRoot n =
  match digits n with | x::[] -> x | h::t -> h + (digitalRoot (sumList t));;

*)

(* changed spans
(10,45)-(10,46)
(10,71)-(10,72)
*)

(* type error slice
(3,25)-(3,47)
(3,25)-(3,60)
(3,26)-(3,37)
(3,48)-(3,49)
(3,50)-(3,60)
(3,50)-(3,60)
(3,51)-(3,59)
(5,3)-(5,36)
(5,11)-(5,34)
(5,15)-(5,26)
(5,15)-(5,34)
(7,21)-(7,70)
(7,21)-(7,70)
(7,59)-(7,70)
(7,60)-(7,67)
(7,68)-(7,69)
(10,2)-(10,74)
(10,2)-(10,74)
(10,2)-(10,74)
(10,8)-(10,14)
(10,8)-(10,16)
(10,45)-(10,46)
(10,45)-(10,74)
(10,62)-(10,73)
(10,63)-(10,70)
(10,71)-(10,72)
*)
