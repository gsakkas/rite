
let rec digitsOfInt n =
  match n < 0 with
  | true  -> []
  | false  ->
      if (n / 10) = 0 then n mod 10 else (digitsOfInt (n / 10)) :: (n mod 10);;


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
(6,27)-(6,35)
(6,41)-(6,63)
(6,41)-(6,77)
(6,67)-(6,77)
*)

(* type error slice
(6,6)-(6,77)
(6,27)-(6,35)
(6,41)-(6,77)
(6,67)-(6,77)
*)

(* all spans
(2,20)-(6,77)
(3,2)-(6,77)
(3,8)-(3,13)
(3,8)-(3,9)
(3,12)-(3,13)
(4,13)-(4,15)
(6,6)-(6,77)
(6,9)-(6,21)
(6,9)-(6,17)
(6,10)-(6,11)
(6,14)-(6,16)
(6,20)-(6,21)
(6,27)-(6,35)
(6,27)-(6,28)
(6,33)-(6,35)
(6,41)-(6,77)
(6,41)-(6,63)
(6,42)-(6,53)
(6,54)-(6,62)
(6,55)-(6,56)
(6,59)-(6,61)
(6,67)-(6,77)
(6,68)-(6,69)
(6,74)-(6,76)
*)
