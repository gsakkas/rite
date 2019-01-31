
let rec digitsOfInt n =
  match n <= 0 with
  | true  -> []
  | false  -> ((digitsOfInt n) / 10) @ (n mod 10);;


(* fix

let rec digitsOfInt n =
  match n <= 0 with
  | true  -> []
  | false  -> (n mod 10) :: (digitsOfInt (n / 10));;

*)

(* changed spans
(5,16)-(5,27)
(n mod 10) :: (digitsOfInt (n / 10))
ConAppG (Just (TupleG (fromList [AppG (fromList [BopG VarG LitG]),BopG VarG LitG]))) Nothing

(5,28)-(5,29)
n mod 10
BopG VarG LitG

(5,39)-(5,49)
digitsOfInt (n / 10)
AppG (fromList [BopG EmptyG EmptyG])

(5,40)-(5,41)
digitsOfInt
VarG

(5,40)-(5,41)
n / 10
BopG VarG LitG

*)
