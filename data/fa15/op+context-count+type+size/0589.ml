
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
(5,41)-(5,49)
*)

(* type error slice
(5,16)-(5,49)
(5,38)-(5,39)
(5,41)-(5,49)
*)
