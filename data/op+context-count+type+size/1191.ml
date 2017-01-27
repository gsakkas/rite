
let rec digitsOfInt n =
  let ns = [] in
  match n with
  | 0 -> 0 :: ns
  | n -> (digitsOfInt (n / 10)) :: (n mod 10) :: ns;;


(* fix

let rec digitsOfInt n =
  let ns = [] in
  match n with | 0 -> 0 :: ns | n -> (n mod 10) :: (digitsOfInt (n / 10));;

*)

(* changed spans
(6,11)-(6,30)
(6,37)-(6,38)
(6,37)-(6,45)
(6,37)-(6,52)
(6,43)-(6,45)
(6,50)-(6,52)
*)

(* type error slice
(2,4)-(6,54)
(2,21)-(6,52)
(3,3)-(6,52)
(4,3)-(6,52)
(4,9)-(4,10)
(5,10)-(5,17)
(6,11)-(6,22)
(6,11)-(6,30)
(6,24)-(6,30)
*)
