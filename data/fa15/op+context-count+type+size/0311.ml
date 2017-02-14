
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
(8,11)-(8,33)
(8,11)-(8,47)
(8,37)-(8,47)
*)

(* type error slice
(2,3)-(8,49)
(2,20)-(8,47)
(3,2)-(8,47)
(6,6)-(8,47)
(8,11)-(8,33)
(8,11)-(8,47)
(8,11)-(8,47)
(8,11)-(8,47)
(8,12)-(8,23)
(8,37)-(8,47)
*)
