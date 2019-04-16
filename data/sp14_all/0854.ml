
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
(6,10)-(6,32)
n mod 10
BopG VarG LitG

(6,36)-(6,52)
digitsOfInt (n / 10)
AppG (fromList [BopG EmptyG EmptyG])

*)

(* type error slice
(2,4)-(6,54)
(2,21)-(6,52)
(3,3)-(6,52)
(4,3)-(6,52)
(5,10)-(5,17)
(6,10)-(6,32)
(6,10)-(6,52)
(6,11)-(6,22)
(6,36)-(6,46)
(6,36)-(6,52)
*)
