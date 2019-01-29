
let rec digitsOfInt n =
  let ns = [] in
  match n with
  | 0 -> 0 :: ns
  | n -> (digitsOfInt (n / 10)) :: (n mod 10) :: ns;;


(* fix

let rec digitsOfInt n =
  let ns = [] in
  match n with | 0 -> 0 :: ns | n -> (n mod 10) :: (digitsOfInt (n / 10));;

*)

(* changed spans
(6,9)-(6,31)
n
VarG

(6,9)-(6,31)
n mod 10
BopG VarG LitG

(6,9)-(6,31)
10
LitG

*)
