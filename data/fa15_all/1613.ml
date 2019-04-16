
let rec digitsOfInt n =
  if n < 0 then [] else (digitsOfInt (n / 10)) :: ([] @ [n mod 10]);;


(* fix

let rec digitsOfInt n = if n < 0 then [] else [] @ [n mod 10];;

*)

(* changed spans
(3,25)-(3,68)
[] @ [n mod 10]
AppG (fromList [ListG (fromList []),ListG (fromList [EmptyG])])

*)

(* type error slice
(2,4)-(3,70)
(2,21)-(3,68)
(3,3)-(3,68)
(3,25)-(3,47)
(3,25)-(3,68)
(3,26)-(3,37)
*)
