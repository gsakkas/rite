
let rec digitsOfInt n =
  match n <= 0 with
  | true  -> []
  | false  -> (n mod 10) :: ((digitsOfInt n) - 10);;


(* fix

let rec digitsOfInt n =
  match n <= 0 with
  | true  -> []
  | false  -> (n mod 10) :: (digitsOfInt (n / 10));;

*)

(* changed spans
(5,28)-(5,50)
(5,42)-(5,43)
*)

(* type error slice
(2,3)-(5,52)
(2,20)-(5,50)
(3,2)-(5,50)
(5,14)-(5,50)
(5,14)-(5,50)
(5,28)-(5,50)
(5,28)-(5,50)
(5,29)-(5,44)
(5,30)-(5,41)
*)
