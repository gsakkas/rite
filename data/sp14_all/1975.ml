
let rec digitsOfInt n =
  if n < 0 then [] else (match n with | 0 -> [0] | _ -> digitsOfInt n []);;


(* fix

let rec digitsOfInt n =
  if n < 0
  then []
  else (match n with | 0 -> [] | _ -> (digitsOfInt (n / 10)) @ [n mod 10]);;

*)

(* changed spans
(3,46)-(3,49)
[]
ListG (fromList [])

(3,57)-(3,73)
digitsOfInt (n / 10) @ [n mod 10]
AppG (fromList [AppG (fromList [EmptyG]),ListG (fromList [EmptyG])])

*)

(* type error slice
(2,4)-(3,76)
(2,21)-(3,74)
(3,3)-(3,74)
(3,25)-(3,74)
(3,57)-(3,68)
(3,57)-(3,73)
*)
