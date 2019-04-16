
let rec digitsOfInt n =
  if n <= 0 then [] else (digitsOfInt (n / 10)) @ [n mod 10];;

let digits n = digitsOfInt (abs n);;

let rec digitalRoot n =
  match digits n with | x::[] -> x | h::t -> h + (digitalRoot (digits t));;


(* fix

let rec digitsOfInt n =
  if n <= 0 then [] else (digitsOfInt (n / 10)) @ [n mod 10];;

let digits n = digitsOfInt (abs n);;

let rec sumList xs = match xs with | [] -> 0 | h::t -> h + (sumList t);;

let rec digitalRoot n =
  match digits n with | x::[] -> x | h::t -> h + (digitalRoot (sumList t));;

*)

(* changed spans
(8,63)-(8,73)
sumList t
AppG (fromList [VarG])

*)

(* type error slice
(5,4)-(5,37)
(5,12)-(5,35)
(5,28)-(5,35)
(5,29)-(5,32)
(5,33)-(5,34)
(8,3)-(8,74)
(8,63)-(8,73)
(8,64)-(8,70)
(8,71)-(8,72)
*)
