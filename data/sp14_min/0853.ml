
let rec digitsOfInt n =
  let ns = [] in
  match n with | 0 -> 0 | n -> ((n mod 10) :: (digitsOfInt (n / 10))) :: ns;;


(* fix

let rec digitsOfInt n =
  let ns = [] in
  match n with | 0 -> 0 :: ns | n -> (n mod 10) :: (digitsOfInt (n / 10));;

*)

(* changed spans
(4,23)-(4,24)
0 :: ns
AppG [LitG,VarG]

(4,32)-(4,70)
n mod 10
BopG VarG LitG

(4,74)-(4,76)
digitsOfInt (n / 10)
AppG [BopG EmptyG EmptyG]

*)

(* type error slice
(2,4)-(4,78)
(2,21)-(4,76)
(3,3)-(4,76)
(4,3)-(4,76)
(4,23)-(4,24)
(4,32)-(4,70)
(4,32)-(4,76)
(4,47)-(4,69)
(4,48)-(4,59)
*)
