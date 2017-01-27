
let rec digitsOfInt n =
  let ns = [] in
  match n with | 0 -> 0 :: ns | n -> (digitsOfInt (n / 10)) :: (n mod 10);;


(* fix

let rec digitsOfInt n =
  let ns = [] in
  match n with | 0 -> 0 :: ns | n -> (n mod 10) :: (digitsOfInt (n / 10));;

*)

(* changed spans
(4,39)-(4,58)
(4,65)-(4,66)
(4,65)-(4,73)
(4,71)-(4,73)
*)

(* type error slice
(2,4)-(4,76)
(2,21)-(4,73)
(3,3)-(4,73)
(4,3)-(4,73)
(4,9)-(4,10)
(4,23)-(4,30)
(4,39)-(4,50)
(4,39)-(4,58)
(4,39)-(4,73)
(4,52)-(4,58)
(4,65)-(4,73)
*)
