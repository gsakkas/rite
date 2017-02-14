
let rec digitsOfInt n =
  let ns = [] in
  match n with | 0 -> 0 | n -> ((n mod 10) :: (digitsOfInt (n / 10))) :: ns;;


(* fix

let rec digitsOfInt n =
  let ns = [] in
  match n with | 0 -> 0 :: ns | n -> (n mod 10) :: (digitsOfInt (n / 10));;

*)

(* changed spans
(4,22)-(4,23)
(4,31)-(4,69)
(4,73)-(4,75)
*)

(* type error slice
(2,3)-(4,77)
(2,20)-(4,75)
(3,2)-(4,75)
(4,2)-(4,75)
(4,2)-(4,75)
(4,22)-(4,23)
(4,31)-(4,69)
(4,31)-(4,75)
(4,46)-(4,68)
(4,47)-(4,58)
*)
