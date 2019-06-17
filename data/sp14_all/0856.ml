
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
(6,32)-(6,64)
(n mod 10) :: (digitsOfInt (n / 10))
AppG [BopG EmptyG EmptyG,AppG [EmptyG]]

*)

(* type error slice
(2,4)-(6,66)
(2,21)-(6,64)
(3,3)-(6,64)
(4,3)-(6,64)
(6,10)-(6,64)
(6,32)-(6,64)
(6,43)-(6,54)
(6,43)-(6,63)
*)
