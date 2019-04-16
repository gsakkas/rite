
let rec digitsOfInt n =
  if n > 0 then [digitsOfInt (n / 10); n mod 10] else [];;


(* fix

let rec digitsOfInt n =
  if n > 0 then (digitsOfInt (n / 10)) @ [n mod 10] else [];;

*)

(* changed spans
(3,17)-(3,49)
digitsOfInt (n / 10) @ [n mod 10]
AppG (fromList [AppG (fromList [EmptyG]),ListG (fromList [EmptyG])])

*)

(* type error slice
(2,4)-(3,59)
(2,21)-(3,57)
(3,3)-(3,57)
(3,17)-(3,49)
(3,18)-(3,29)
(3,18)-(3,38)
(3,40)-(3,48)
(3,55)-(3,57)
*)
