
let rec digitsOfInt n =
  let ns = [] in
  match n with | 0 -> 0 | n -> (n mod 10) :: (digitsOfInt (n / 10));;


(* fix

let rec digitsOfInt n =
  let ns = [] in
  match n with | 0 -> 0 :: ns | n -> (n mod 10) :: (digitsOfInt (n / 10));;

*)

(* changed spans
(4,22)-(4,23)
(4,31)-(4,67)
*)

(* type error slice
(2,3)-(4,69)
(2,20)-(4,67)
(3,2)-(4,67)
(4,2)-(4,67)
(4,2)-(4,67)
(4,22)-(4,23)
(4,31)-(4,67)
(4,31)-(4,67)
(4,45)-(4,67)
(4,46)-(4,57)
*)
