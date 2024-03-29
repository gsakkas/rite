
let rec digitsOfInt n =
  match n <= 0 with
  | true  -> []
  | false  -> (digitsOfInt (n / 10)) :: (n mod 10);;


(* fix

let rec digitsOfInt n =
  match n <= 0 with
  | true  -> []
  | false  -> (n mod 10) :: (digitsOfInt (n / 10));;

*)

(* changed spans
(5,15)-(5,37)
n mod 10
BopG VarG LitG

(5,41)-(5,51)
digitsOfInt (n / 10)
AppG [BopG EmptyG EmptyG]

*)

(* type error slice
(2,4)-(5,53)
(2,21)-(5,51)
(3,3)-(5,51)
(5,15)-(5,37)
(5,15)-(5,51)
(5,16)-(5,27)
(5,41)-(5,51)
*)
