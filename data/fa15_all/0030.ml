
let rec digitsOfInt n =
  match n < 0 with | true  -> [] | false  -> [[(digitsOfInt n) / 10]];;


(* fix

let rec digitsOfInt n =
  match n < 0 with
  | true  -> []
  | false  -> (n mod 10) :: (digitsOfInt (n / 10));;

let _ = digitsOfInt 3124;;

*)

(* changed spans
(3,46)-(3,70)
(n mod 10) :: (digitsOfInt (n / 10))
ConAppG (Just (TupleG (fromList [EmptyG])))

*)

(* type error slice
(2,4)-(3,72)
(2,21)-(3,70)
(3,3)-(3,70)
(3,46)-(3,70)
(3,48)-(3,63)
(3,48)-(3,68)
(3,49)-(3,60)
*)
