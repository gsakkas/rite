
let rec digitsOfInt n =
  let ns = [] in
  match n with
  | 0 -> ns
  | n -> if n < 0 then [] else [(n mod 10) :: (digitsOfInt (n / 10))];;


(* fix

let rec digitsOfInt n =
  let ns = [] in
  match n with
  | 0 -> ns
  | n -> if n < 0 then [] else (n mod 10) :: (digitsOfInt (n / 10));;

*)

(* changed spans
(6,32)-(6,70)
*)

(* type error slice
(2,4)-(6,72)
(2,21)-(6,70)
(3,3)-(6,70)
(4,3)-(6,70)
(6,10)-(6,70)
(6,32)-(6,70)
(6,32)-(6,70)
(6,34)-(6,67)
(6,34)-(6,67)
(6,48)-(6,59)
(6,48)-(6,67)
*)
