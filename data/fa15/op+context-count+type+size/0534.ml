
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
