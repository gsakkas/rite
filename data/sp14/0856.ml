
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
(6,31)-(6,63)
*)

(* type error slice
(2,3)-(6,65)
(2,20)-(6,63)
(3,2)-(6,63)
(4,2)-(6,63)
(6,9)-(6,63)
(6,31)-(6,63)
(6,42)-(6,53)
(6,42)-(6,62)
*)

(* all spans
(2,20)-(6,63)
(3,2)-(6,63)
(3,11)-(3,13)
(4,2)-(6,63)
(4,8)-(4,9)
(5,9)-(5,11)
(6,9)-(6,63)
(6,12)-(6,17)
(6,12)-(6,13)
(6,16)-(6,17)
(6,23)-(6,25)
(6,31)-(6,63)
(6,32)-(6,40)
(6,32)-(6,33)
(6,38)-(6,40)
(6,42)-(6,62)
(6,42)-(6,53)
(6,54)-(6,62)
(6,55)-(6,56)
(6,59)-(6,61)
*)
