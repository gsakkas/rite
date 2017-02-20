
let rec digitsOfInt n =
  match n <= 0 with
  | true  -> []
  | false  -> [(digitsOfInt n) / 10; n mod 10];;


(* fix

let rec digitsOfInt n =
  match n <= 0 with | true  -> [] | false  -> (n mod 10) :: (digitsOfInt n);;

*)

(* changed spans
(5,14)-(5,46)
(5,15)-(5,30)
(5,15)-(5,35)
(5,16)-(5,27)
(5,28)-(5,29)
(5,33)-(5,35)
*)

(* type error slice
(2,3)-(5,48)
(2,20)-(5,46)
(3,2)-(5,46)
(5,14)-(5,46)
(5,15)-(5,30)
(5,15)-(5,35)
(5,16)-(5,27)
*)

(* all spans
(2,20)-(5,46)
(3,2)-(5,46)
(3,8)-(3,14)
(3,8)-(3,9)
(3,13)-(3,14)
(4,13)-(4,15)
(5,14)-(5,46)
(5,15)-(5,35)
(5,15)-(5,30)
(5,16)-(5,27)
(5,28)-(5,29)
(5,33)-(5,35)
(5,37)-(5,45)
(5,37)-(5,38)
(5,43)-(5,45)
*)
