
let rec digitsOfInt n =
  let ns = [] in match n with | n -> (((n mod 10) :: ns) digitsOfInt n) / 10;;


(* fix

let rec digitsOfInt n =
  let ns = [] in
  match n with | 0 -> 0 :: ns | n -> (n mod 10) :: (digitsOfInt (n / 10));;

*)

(* changed spans
(3,17)-(3,76)
(3,37)-(3,71)
(3,37)-(3,76)
(3,39)-(3,49)
(3,53)-(3,55)
(3,69)-(3,70)
*)

(* type error slice
(3,37)-(3,71)
(3,38)-(3,56)
*)
