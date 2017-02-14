
let rec digitsOfInt n =
  match n < 0 with
  | true  -> []
  | false  ->
      if (n / 10) = 0 then [n mod 10] else [digitsOfInt (n / 10); n mod 10];;


(* fix

let rec digitsOfInt n =
  match n < 0 with
  | true  -> []
  | false  ->
      if (n / 10) = 0
      then [n mod 10]
      else (digitsOfInt (n / 10)) @ [n mod 10];;

*)

(* changed spans
(6,43)-(6,75)
(6,44)-(6,64)
(6,66)-(6,74)
*)

(* type error slice
(2,3)-(6,77)
(2,20)-(6,75)
(3,2)-(6,75)
(6,6)-(6,75)
(6,27)-(6,37)
(6,43)-(6,75)
(6,43)-(6,75)
(6,44)-(6,55)
(6,44)-(6,64)
(6,66)-(6,74)
*)
