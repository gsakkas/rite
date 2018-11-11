
let rec digitsOfInt n = if n > 0 then [n; n mod 10];;


(* fix

let rec digitsOfInt n =
  if n > 0 then (n mod 10) :: (digitsOfInt (n / 10)) else [];;

*)

(* changed spans
(2,24)-(2,51)
digitsOfInt (n / 10)
AppG [BopG EmptyG EmptyG]

(2,39)-(2,40)
(n mod 10) :: (digitsOfInt (n / 10))
ConAppG (Just (TupleG [BopG VarG LitG,AppG [BopG VarG LitG]])) Nothing

*)
