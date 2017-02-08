
let rec digitsOfInt n =
  let ns = [] in
  match n with | 0 -> 0 | n -> (n mod 10) :: (digitsOfInt (n / 10));;


(* fix

let rec digitsOfInt n =
  let ns = [] in
  match n with | 0 -> 0 :: ns | n -> (n mod 10) :: (digitsOfInt (n / 10));;

*)

(* changed spans
(4,23)-(4,24)
(4,33)-(4,66)
*)

(* type error slice
(2,4)-(4,70)
(2,21)-(4,66)
(3,3)-(4,66)
(4,3)-(4,66)
(4,3)-(4,66)
(4,23)-(4,24)
(4,33)-(4,66)
(4,33)-(4,66)
(4,47)-(4,58)
(4,47)-(4,66)
*)
