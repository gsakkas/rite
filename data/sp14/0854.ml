
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
(6,9)-(6,31)
(6,35)-(6,45)
(6,35)-(6,51)
(6,36)-(6,37)
(6,42)-(6,44)
(6,49)-(6,51)
*)

(* type error slice
(2,3)-(6,53)
(2,20)-(6,51)
(3,2)-(6,51)
(4,2)-(6,51)
(5,9)-(5,16)
(6,9)-(6,31)
(6,9)-(6,51)
(6,9)-(6,51)
(6,10)-(6,21)
(6,35)-(6,45)
(6,35)-(6,51)
(6,35)-(6,51)
*)

(* all spans
(2,20)-(6,51)
(3,2)-(6,51)
(3,11)-(3,13)
(4,2)-(6,51)
(4,8)-(4,9)
(5,9)-(5,16)
(5,9)-(5,10)
(5,14)-(5,16)
(6,9)-(6,51)
(6,9)-(6,31)
(6,10)-(6,21)
(6,22)-(6,30)
(6,23)-(6,24)
(6,27)-(6,29)
(6,35)-(6,51)
(6,35)-(6,45)
(6,36)-(6,37)
(6,42)-(6,44)
(6,49)-(6,51)
*)
