
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
(5,15)-(5,37)
(5,15)-(5,49)
(5,17)-(5,28)
(5,17)-(5,30)
(5,17)-(5,36)
(5,29)-(5,30)
(5,38)-(5,39)
(5,41)-(5,42)
(5,41)-(5,49)
*)

(* type error slice
(2,4)-(5,52)
(2,21)-(5,49)
(3,3)-(5,49)
(4,14)-(4,16)
(5,15)-(5,49)
(5,17)-(5,28)
(5,17)-(5,30)
(5,17)-(5,36)
(5,38)-(5,39)
(5,41)-(5,49)
*)
