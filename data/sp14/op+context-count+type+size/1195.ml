
let rec digitsOfInt n =
  let ns = [] in
  match n with
  | 0 -> ns
  | n -> if n < 0 then [] else [n mod 10; digitsOfInt (n / 10)];;


(* fix

let rec digitsOfInt n =
  let ns = [] in
  match n with
  | 0 -> ns
  | n -> if n < 0 then [] else (n mod 10) :: (digitsOfInt (n / 10));;

*)

(* changed spans
(6,31)-(6,63)
*)

(* type error slice
(2,3)-(6,65)
(2,20)-(6,63)
(3,2)-(6,63)
(4,2)-(6,63)
(6,9)-(6,63)
(6,31)-(6,63)
(6,31)-(6,63)
(6,42)-(6,53)
(6,42)-(6,62)
*)
