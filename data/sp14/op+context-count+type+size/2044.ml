
let rec digitsOfInt n = match n with | 0 -> [] | n -> [digitsOfInt n];;


(* fix

let rec digitsOfInt n =
  match n with | 0 -> [] | _ -> (digitsOfInt (n / 10)) @ [n mod 10];;

*)

(* changed spans
(2,24)-(2,69)
(2,54)-(2,69)
(2,55)-(2,68)
(2,67)-(2,68)
*)

(* type error slice
(2,3)-(2,71)
(2,20)-(2,69)
(2,24)-(2,69)
(2,54)-(2,69)
(2,54)-(2,69)
(2,55)-(2,66)
(2,55)-(2,68)
*)
