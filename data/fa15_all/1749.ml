
let rec digitsOfInt n =
  match n <= 0 with
  | true  -> []
  | false  -> [(digitsOfInt n) / 10] @ (n mod 10);;


(* fix

let rec digitsOfInt n =
  match n <= 0 with
  | true  -> []
  | false  -> (n mod 10) :: (digitsOfInt (n / 10));;

*)

(* changed spans
(5,15)-(5,50)
(n mod 10) :: (digitsOfInt (n / 10))
ConAppG (Just (TupleG (fromList [EmptyG])))

*)

(* type error slice
(2,4)-(5,52)
(2,21)-(5,50)
(3,3)-(5,50)
(4,14)-(4,16)
(5,15)-(5,50)
(5,16)-(5,31)
(5,16)-(5,36)
(5,17)-(5,28)
(5,38)-(5,39)
(5,40)-(5,50)
*)
