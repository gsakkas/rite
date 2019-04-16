
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
(8,9)-(8,10)
digits n
AppG (fromList [VarG])

(8,56)-(8,66)
sumList t
AppG (fromList [VarG])

*)

(* type error slice
(5,4)-(5,37)
(5,12)-(5,35)
(5,28)-(5,35)
(5,29)-(5,32)
(5,33)-(5,34)
(8,3)-(8,67)
(8,56)-(8,66)
(8,57)-(8,63)
(8,64)-(8,65)
*)
