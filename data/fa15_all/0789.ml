
let rec append l r = match l with | [] -> r | h::t -> h :: (append t r);;

let rec digitsOfInt n =
  if n <= 0 then n else append (digitsOfInt (n / 10) [n mod 10]);;


(* fix

let rec append l r = match l with | [] -> r | h::t -> h :: (append t r);;

let rec digitsOfInt n =
  if n <= 0 then [n] else append (digitsOfInt (n / 10)) [n mod 10];;

*)

(* changed spans
(5,17)-(5,18)
[n]
ListG VarG Nothing

(5,32)-(5,43)
append
VarG

(5,32)-(5,43)
digitsOfInt (n / 10)
AppG (fromList [BopG EmptyG EmptyG])

*)
