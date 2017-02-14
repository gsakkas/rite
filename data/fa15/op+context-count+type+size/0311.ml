
let rec digitsOfInt n =
  match n < 0 with
  | true  -> []
  | false  ->
      if (n / 10) = 0
      then [n mod 10]
      else (digitsOfInt (n / 10)) :: (n mod 10);;


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
(8,13)-(8,32)
(8,13)-(8,47)
(8,39)-(8,47)
*)

(* type error slice
(2,4)-(8,50)
(2,21)-(8,47)
(3,3)-(8,47)
(6,7)-(8,47)
(8,13)-(8,24)
(8,13)-(8,32)
(8,13)-(8,47)
(8,13)-(8,47)
(8,13)-(8,47)
(8,39)-(8,47)
*)
