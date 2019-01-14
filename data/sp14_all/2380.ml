
let rec digitsOfInt n =
  if n <= 0 then [] else (digitsOfInt (n / 10)) :: (n mod 10);;


(* fix

let rec digitsOfInt n =
  if n <= 0 then [] else (n / 10) :: (digitsOfInt (n / 10));;

*)

(* changed spans
(3,51)-(3,61)
digitsOfInt (n / 10)
AppG (fromList [BopG EmptyG EmptyG])

(3,52)-(3,53)
digitsOfInt
VarG

(3,52)-(3,53)
n / 10
BopG VarG LitG

*)
