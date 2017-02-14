
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
(10,46)-(10,47)
(10,72)-(10,73)
*)

(* type error slice
(3,27)-(3,38)
(3,27)-(3,46)
(3,27)-(3,61)
(3,49)-(3,50)
(3,51)-(3,61)
(3,51)-(3,61)
(3,52)-(3,60)
(5,4)-(5,37)
(5,12)-(5,34)
(5,16)-(5,27)
(5,16)-(5,34)
(7,22)-(7,70)
(7,22)-(7,70)
(7,61)-(7,68)
(7,61)-(7,70)
(7,69)-(7,70)
(10,3)-(10,73)
(10,3)-(10,73)
(10,3)-(10,73)
(10,9)-(10,15)
(10,9)-(10,17)
(10,46)-(10,47)
(10,46)-(10,73)
(10,64)-(10,71)
(10,64)-(10,73)
(10,72)-(10,73)
*)
