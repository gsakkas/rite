
let rec digitsOfInt n =
  match n <= 0 with
  | true  -> []
  | false  -> [[digitsOfInt (n / 10)]; n mod 10];;


(* fix

let rec digitsOfInt n =
  match n <= 0 with
  | true  -> []
  | false  -> (n mod 10) :: (digitsOfInt (n / 10));;

*)

(* changed spans
(5,15)-(5,49)
(n mod 10) :: (digitsOfInt (n / 10))
AppG [BopG EmptyG EmptyG,AppG [EmptyG]]

*)

(* type error slice
(2,4)-(5,51)
(2,21)-(5,49)
(3,3)-(5,49)
(5,15)-(5,49)
(5,16)-(5,38)
(5,17)-(5,28)
(5,17)-(5,37)
(5,40)-(5,48)
*)
