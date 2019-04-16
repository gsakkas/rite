
let rec digitsOfInt n =
  let ns = [] in
  match n with | 0 -> 0 | n -> (n mod 10) :: (digitsOfInt (n / 10));;


(* fix

let rec digitsOfInt n =
  let ns = [] in
  match n with | 0 -> 0 :: ns | n -> (n mod 10) :: (digitsOfInt (n / 10));;

*)

(* changed spans
(4,23)-(4,24)
0 :: ns
ConAppG (Just (TupleG (fromList [EmptyG])))

*)

(* type error slice
(2,4)-(4,70)
(2,21)-(4,68)
(3,3)-(4,68)
(4,3)-(4,68)
(4,23)-(4,24)
(4,32)-(4,68)
(4,46)-(4,68)
(4,47)-(4,58)
*)
