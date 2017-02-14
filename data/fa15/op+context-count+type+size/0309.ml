
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

*)

(* changed spans
(6,27)-(6,35)
(6,41)-(6,63)
(6,41)-(6,77)
(6,67)-(6,77)
(6,68)-(6,69)
(6,74)-(6,76)
*)

(* type error slice
(3,2)-(6,77)
(3,2)-(6,77)
(4,13)-(4,15)
(6,6)-(6,77)
(6,6)-(6,77)
(6,27)-(6,35)
(6,41)-(6,77)
(6,41)-(6,77)
(6,67)-(6,77)
*)
