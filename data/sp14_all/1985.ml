
let rec digitsOfInt n =
  if n < 0
  then []
  else (match n with | 0 -> [] | _ -> [digitsOfInt (n / 10); n mod 10]);;


(* fix

let rec digitsOfInt n =
  if n < 0
  then []
  else (match n with | 0 -> [] | _ -> (digitsOfInt (n / 10)) @ [n mod 10]);;

*)

(* changed spans
(5,39)-(5,71)
digitsOfInt (n / 10) @ [n mod 10]
AppG (fromList [AppG (fromList [EmptyG]),ListG (fromList [EmptyG])])

*)

(* type error slice
(2,4)-(5,74)
(2,21)-(5,72)
(3,3)-(5,72)
(5,8)-(5,72)
(5,39)-(5,71)
(5,40)-(5,51)
(5,40)-(5,60)
*)
