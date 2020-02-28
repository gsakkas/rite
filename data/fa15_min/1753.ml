
let rec digitsOfInt n =
  match n <= 0 with
  | true  -> []
  | false  -> [digitsOfInt (n / 10); n mod 10];;


(* fix

let rec digitsOfInt n =
  match n <= 0 with
  | true  -> []
  | false  -> (n mod 10) :: (digitsOfInt (n / 10));;

*)

(* changed spans
(5,15)-(5,47)
(n mod 10) :: (digitsOfInt (n / 10))
AppG [BopG EmptyG EmptyG,AppG [EmptyG]]

*)

(* type error slice
(2,4)-(5,49)
(2,21)-(5,47)
(3,3)-(5,47)
(5,15)-(5,47)
(5,16)-(5,27)
(5,16)-(5,36)
*)
