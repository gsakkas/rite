
let rec digitsOfInt n = if n < 0 then [] else n mod 10; (digitsOfInt n) / 10;;


(* fix

let rec digitsOfInt n =
  if n < 0 then print_int 0 else print_int (n / 10); digitsOfInt (n / 10);;

*)

(* changed spans
(2,46)-(2,47)
print_int
VarG

(2,46)-(2,47)
print_int
VarG

(2,46)-(2,47)
print_int (n / 10)
AppG (fromList [BopG EmptyG EmptyG])

(2,46)-(2,47)
n / 10
BopG VarG LitG

(2,46)-(2,47)
0
LitG

(2,46)-(2,54)
print_int 0
AppG (fromList [LitG])

(2,69)-(2,70)
n / 10
BopG VarG LitG

*)
