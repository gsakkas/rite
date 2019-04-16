
let rec append l r = match l with | [] -> r | h::t -> h :: (append t r);;

let rec digitsOfInt n =
  if n <= 0 then n else append (n mod 10) (digitsOfInt (n / 10));;


(* fix

let rec append l r = match l with | [] -> r | h::t -> h :: (append t r);;

let rec digitsOfInt n =
  if n <= 0 then [n] else append (digitsOfInt (n / 10)) [n mod 10];;

*)

(* changed spans
(5,18)-(5,19)
[n]
ListG (fromList [VarG])

(5,32)-(5,42)
digitsOfInt (n / 10)
AppG (fromList [BopG EmptyG EmptyG])

(5,43)-(5,65)
[n mod 10]
ListG (fromList [BopG EmptyG EmptyG])

*)

(* type error slice
(2,22)-(2,72)
(2,60)-(2,72)
(2,61)-(2,67)
(2,68)-(2,69)
(5,25)-(5,31)
(5,25)-(5,65)
(5,32)-(5,42)
*)
