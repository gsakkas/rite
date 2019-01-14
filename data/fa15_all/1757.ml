
let rec digitsOfInt n =
  match n <= 0 with
  | true  -> []
  | false  -> ((digitsOfInt n) / 10) :: (n mod 10);;


(* fix

let rec digitsOfInt n =
  match n <= 0 with
  | true  -> []
  | false  -> (n mod 10) :: (digitsOfInt (n / 10));;

*)

(* changed spans
(5,16)-(5,27)
n mod 10
BopG VarG LitG

(5,40)-(5,50)
digitsOfInt (n / 10)
AppG (fromList [BopG EmptyG EmptyG])

(5,41)-(5,42)
digitsOfInt
VarG

(5,41)-(5,42)
n / 10
BopG VarG LitG

*)
