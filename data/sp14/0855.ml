
let rec digitsOfInt n =
  let ns = [] in
  match n with | 0 -> 0 :: ns | n -> (digitsOfInt (n / 10)) :: (n mod 10);;


(* fix

let rec digitsOfInt n =
  let ns = [] in
  match n with | 0 -> 0 :: ns | n -> (n mod 10) :: (digitsOfInt (n / 10));;

*)

(* changed spans
(4,38)-(4,60)
n mod 10
BopG VarG LitG

(4,64)-(4,74)
digitsOfInt (n / 10)
AppG [BopG EmptyG EmptyG]

*)

(* type error slice
(2,4)-(4,76)
(2,21)-(4,74)
(3,3)-(4,74)
(4,3)-(4,74)
(4,38)-(4,60)
(4,38)-(4,74)
(4,39)-(4,50)
(4,64)-(4,74)
*)
