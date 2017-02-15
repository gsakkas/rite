
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

*)

(* changed spans
(8,11)-(8,33)
(8,11)-(8,47)
(8,12)-(8,32)
(8,37)-(8,47)
*)

(* type error slice
(6,6)-(8,47)
(6,6)-(8,47)
(7,11)-(7,21)
(7,11)-(7,21)
(7,12)-(7,20)
(8,11)-(8,33)
(8,11)-(8,47)
(8,11)-(8,47)
(8,11)-(8,47)
(8,37)-(8,47)
*)
