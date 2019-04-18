
let rec digitsOfInt n =
  match n <= 0 with
  | true  -> []
  | false  -> [digitsOfInt (n / 10)] @ [n mod 10];;


(* fix

let rec digitsOfInt n =
  match n <= 0 with
  | true  -> []
  | false  -> (n mod 10) :: (digitsOfInt (n / 10));;

*)

(* changed spans
(5,15)-(5,50)
(n mod 10) :: (digitsOfInt (n / 10))
AppG (fromList [AppG (fromList [EmptyG]),BopG EmptyG EmptyG])

*)

(* type error slice
(2,4)-(5,52)
(2,21)-(5,50)
(3,3)-(5,50)
(5,15)-(5,37)
(5,15)-(5,50)
(5,16)-(5,27)
(5,16)-(5,36)
(5,38)-(5,39)
*)
