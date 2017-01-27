
let rec digitsOfInt n =
  let ns = [] in match n with | n -> (((n mod 10) :: ns) digitsOfInt n) / 10;;


(* fix

let rec digitsOfInt n =
  let ns = [] in
  match n with | 0 -> 0 :: ns | n -> (n mod 10) :: (digitsOfInt (n / 10));;

*)

(* changed spans
(3,18)-(3,77)
(3,41)-(3,49)
(3,41)-(3,71)
(3,41)-(3,77)
(3,54)-(3,56)
(3,70)-(3,71)
*)

(* type error slice
(3,41)-(3,42)
(3,41)-(3,49)
(3,41)-(3,56)
(3,41)-(3,71)
(3,58)-(3,69)
(3,70)-(3,71)
*)
