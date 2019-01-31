
let rec append l r = match l with | [] -> r | h::t -> h :: (append t r);;

let rec digitsOfInt n =
  if n <= 0 then n else (append n) mod (10 digitsOfInt (n / 10));;


(* fix

let rec append l r = match l with | [] -> r | h::t -> h :: (append t r);;

let rec digitsOfInt n =
  if n <= 0 then [n] else append (digitsOfInt (n / 10)) [n mod 10];;

*)

(* changed spans
(5,25)-(5,31)
[n]
ListG VarG Nothing

(5,40)-(5,42)
append
VarG

(5,43)-(5,54)
digitsOfInt (n / 10)
AppG (fromList [BopG EmptyG EmptyG])

*)
