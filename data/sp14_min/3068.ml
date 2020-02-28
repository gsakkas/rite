
let rec digitsOfInt n =
  match n with | 0 -> [] | _ -> (digitsOfInt (n / 10)) :: (n mod 10);;


(* fix

let rec digitsOfInt n =
  match n with | 0 -> [] | _ -> (n mod 10) :: (digitsOfInt (n / 10));;

*)

(* changed spans
(3,33)-(3,55)
n mod 10
BopG VarG LitG

(3,59)-(3,69)
digitsOfInt (n / 10)
AppG [BopG EmptyG EmptyG]

*)

(* type error slice
(2,4)-(3,71)
(2,21)-(3,69)
(3,3)-(3,69)
(3,33)-(3,55)
(3,33)-(3,69)
(3,34)-(3,45)
(3,59)-(3,69)
*)
