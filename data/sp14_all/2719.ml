
let rec digitsOfInt n = if n > 0 then [digitsOfInt (n / 10); n mod 10] else 0;;


(* fix

let rec digitsOfInt n =
  if n > 0 then (digitsOfInt (n / 10)) @ [n mod 10] else [];;

*)

(* changed spans
(2,39)-(2,71)
digitsOfInt (n / 10) @ [n mod 10]
AppG (fromList [AppG (fromList [EmptyG]),ListG (fromList [EmptyG])])

(2,77)-(2,78)
[]
ListG (fromList [])

*)

(* type error slice
(2,25)-(2,78)
(2,39)-(2,71)
(2,77)-(2,78)
*)
