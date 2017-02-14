
let rec digitsOfInt n =
  match n <= 0 with
  | true  -> []
  | false  -> [(digitsOfInt n) / 10; n mod 10];;


(* fix

let rec digitsOfInt n =
  match n <= 0 with
  | true  -> []
  | false  -> (n mod 10) :: (digitsOfInt (n / 10));;

*)

(* changed spans
(5,15)-(5,47)
(5,17)-(5,28)
(5,17)-(5,30)
(5,17)-(5,36)
(5,29)-(5,30)
(5,38)-(5,39)
(5,38)-(5,46)
*)

(* type error slice
(2,4)-(5,49)
(2,21)-(5,47)
(3,3)-(5,47)
(5,15)-(5,47)
(5,17)-(5,28)
(5,17)-(5,30)
(5,17)-(5,36)
*)
