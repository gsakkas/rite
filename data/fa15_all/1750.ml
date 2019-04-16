
let rec digitsOfInt n =
  match n <= 0 with
  | true  -> []
  | false  -> [digitsOfInt (n / 10)] @ (n mod 10);;


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
(5,15)-(5,50)
(5,38)-(5,39)
(5,40)-(5,50)
*)
