
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
(5,31)-(5,50)
(5,43)-(5,44)
*)

(* type error slice
(2,4)-(5,53)
(2,21)-(5,50)
(3,3)-(5,50)
(5,16)-(5,50)
(5,16)-(5,50)
(5,31)-(5,42)
(5,31)-(5,44)
(5,31)-(5,50)
(5,31)-(5,50)
*)
