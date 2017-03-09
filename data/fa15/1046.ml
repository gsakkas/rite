
let rec digitsOfInt n =
  match n <= 0 with
  | true  -> []
  | false  -> (digitsOfInt (n / 10)) @ (n mod 10);;


(* fix

let rec digitsOfInt n =
  match n <= 0 with
  | true  -> []
  | false  -> (digitsOfInt (n / 10)) @ [n mod 10];;

*)

(* changed spans
(5,39)-(5,49)
*)

(* type error slice
(5,14)-(5,49)
(5,37)-(5,38)
(5,39)-(5,49)
*)

(* all spans
(2,20)-(5,49)
(3,2)-(5,49)
(3,8)-(3,14)
(3,8)-(3,9)
(3,13)-(3,14)
(4,13)-(4,15)
(5,14)-(5,49)
(5,37)-(5,38)
(5,14)-(5,36)
(5,15)-(5,26)
(5,27)-(5,35)
(5,28)-(5,29)
(5,32)-(5,34)
(5,39)-(5,49)
(5,40)-(5,41)
(5,46)-(5,48)
*)
