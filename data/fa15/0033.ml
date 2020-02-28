
let rec digitsOfInt n =
  match n < 0 with
  | true  -> []
  | false  ->
      if (n / 10) = 0
      then [n mod 10]
      else [digitsOfInt (n / 10)] :: (n mod 10);;


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
(8,12)-(8,48)
digitsOfInt (n / 10) @ [n mod 10]
AppG [AppG [EmptyG],ListG [EmptyG]]

*)

(* type error slice
(6,7)-(8,48)
(7,12)-(7,22)
(7,13)-(7,21)
(8,12)-(8,34)
(8,12)-(8,48)
(8,38)-(8,48)
*)
