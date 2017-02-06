
let rec digitsOfInt n =
  match n <= 0 with
  | true  -> []
  | false  -> [(digitsOfInt n) / 10; n mod 10];;


(* fix

let rec digitsOfInt n =
  match n <= 0 with | true  -> [] | false  -> (n mod 10) :: (digitsOfInt n);;

*)

(* changed spans
(5,15)-(5,47)
(5,17)-(5,28)
(5,17)-(5,30)
(5,17)-(5,36)
(5,29)-(5,30)
(5,34)-(5,36)
*)

(* type error slice
(2,21)-(5,47)
(3,3)-(5,47)
(3,9)-(3,10)
(3,9)-(3,15)
(4,14)-(4,16)
(5,17)-(5,28)
(5,17)-(5,30)
*)
