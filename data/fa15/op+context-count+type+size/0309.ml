
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
(6,28)-(6,36)
(6,43)-(6,62)
(6,43)-(6,77)
(6,69)-(6,70)
(6,69)-(6,77)
(6,75)-(6,77)
*)

(* type error slice
(3,3)-(6,77)
(3,3)-(6,77)
(4,14)-(4,16)
(6,7)-(6,77)
(6,7)-(6,77)
(6,28)-(6,36)
(6,43)-(6,77)
(6,43)-(6,77)
(6,69)-(6,77)
*)
