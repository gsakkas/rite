
let rec digitsOfInt n =
  let ns = [] in
  match n with | 0 -> 0 | n -> ((n mod 10) :: (digitsOfInt (n / 10))) :: ns;;


(* fix

let rec digitsOfInt n =
  let ns = [] in
  match n with | 0 -> 0 :: ns | n -> (n mod 10) :: (digitsOfInt (n / 10));;

*)

(* changed spans
(4,31)-(4,69)
ns
VarG

(4,31)-(4,69)
0
LitG

*)
