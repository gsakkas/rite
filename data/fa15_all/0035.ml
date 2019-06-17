
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

let _ = digitsOfInt 3124;;

*)

(* changed spans
(6,44)-(6,76)
digitsOfInt (n / 10) @ [n mod 10]
AppG [AppG [EmptyG],ListG [EmptyG]]

*)

(* type error slice
(2,4)-(6,78)
(2,21)-(6,76)
(3,3)-(6,76)
(6,7)-(6,76)
(6,44)-(6,76)
(6,45)-(6,56)
(6,45)-(6,65)
*)
