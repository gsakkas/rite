
let rec digitsOfInt n =
  let ns = [] in
  match n with
  | 0 -> ns
  | n -> if n < 0 then [] else [(n mod 10) :: (digitsOfInt (n / 10))];;


(* fix

let rec digitsOfInt n =
  let ns = [] in
  match n with
  | 0 -> ns
  | n -> if n < 0 then [] else (n mod 10) :: (digitsOfInt (n / 10));;

*)

(* changed spans
(6,31)-(6,69)
*)

(* type error slice
(2,3)-(6,71)
(2,20)-(6,69)
(3,2)-(6,69)
(4,2)-(6,69)
(6,9)-(6,69)
(6,31)-(6,69)
(6,31)-(6,69)
(6,32)-(6,68)
(6,32)-(6,68)
(6,46)-(6,68)
(6,47)-(6,58)
*)
