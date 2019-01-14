
let rec append l r = match l with | [] -> r | h::t -> h :: (append t r);;

let rec digitsOfInt n =
  if n <= 0 then [n] else (append digitsOfInt n) / (10 [n]);;


(* fix

let rec append l r = match l with | [] -> r | h::t -> h :: (append t r);;

let rec digitsOfInt n =
  if n <= 0 then [n] else append (digitsOfInt (n / 10)) [n mod 10];;

*)

(* changed spans
(5,34)-(5,45)
digitsOfInt (n / 10)
AppG (fromList [BopG EmptyG EmptyG])

(5,46)-(5,47)
n / 10
BopG VarG LitG

(5,56)-(5,57)
n mod 10
BopG VarG LitG

*)
