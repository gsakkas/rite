
let rec digitsOfInt n =
  let ns = [] in
  match n with | 0 -> 0 | n -> (n mod 10) :: (digitsOfInt (n / 10));;


(* fix

let rec digitsOfInt n =
  let ns = [] in
  match n with | 0 -> 0 :: ns | n -> (n mod 10) :: (digitsOfInt (n / 10));;

*)

(* changed spans
(4,22)-(4,23)
0 :: ns
ConAppG (Just (TupleG [LitG,VarG])) Nothing

(4,31)-(4,67)
ns
VarG

*)
