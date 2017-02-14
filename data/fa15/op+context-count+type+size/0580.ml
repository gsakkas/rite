
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
(5,14)-(5,36)
(5,14)-(5,49)
(5,15)-(5,35)
(5,37)-(5,38)
(5,39)-(5,49)
(5,40)-(5,41)
(5,46)-(5,48)
*)

(* type error slice
(5,14)-(5,49)
(5,37)-(5,38)
(5,39)-(5,49)
*)
