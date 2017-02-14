
let rec digitsOfInt n =
  let ns = [] in
  match n with | 0 -> 0 :: ns | n -> (digitsOfInt (n / 10)) :: (n mod 10);;


(* fix

let rec digitsOfInt n =
  let ns = [] in
  match n with | 0 -> 0 :: ns | n -> (n mod 10) :: (digitsOfInt (n / 10));;

*)

(* changed spans
(4,37)-(4,59)
(4,63)-(4,73)
(4,64)-(4,65)
(4,70)-(4,72)
*)

(* type error slice
(2,3)-(4,75)
(2,20)-(4,73)
(3,2)-(4,73)
(4,2)-(4,73)
(4,37)-(4,59)
(4,37)-(4,73)
(4,37)-(4,73)
(4,37)-(4,73)
(4,38)-(4,49)
(4,63)-(4,73)
*)
