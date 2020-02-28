
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
(5,29)-(5,51)
digitsOfInt (n / 10)
AppG [BopG EmptyG EmptyG]

*)

(* type error slice
(2,4)-(5,53)
(2,21)-(5,51)
(3,3)-(5,51)
(5,15)-(5,51)
(5,29)-(5,51)
(5,30)-(5,45)
(5,31)-(5,42)
*)
