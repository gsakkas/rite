
let rec digitsOfInt n =
  let ns = [] in
  match n with | 0 -> 0 :: ns | n -> (digitsOfInt (n / 10)) :: (n mod 10);;


(* fix

let rec digitsOfInt n =
  let ns = [] in
  match n with | 0 -> 0 :: ns | n -> (n mod 10) :: (digitsOfInt (n / 10));;

*)

(* changed spans
(4,37)-(4,59)
n
VarG

(4,37)-(4,59)
n mod 10
BopG VarG LitG

(4,37)-(4,59)
10
LitG

*)
