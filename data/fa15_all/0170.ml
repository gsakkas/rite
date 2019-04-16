
let rec digitsOfInt n = if n > 0 then [n mod 10];;


(* fix

let rec digitsOfInt n = if n > 0 then [n mod 10] else [];;

*)

(* changed spans
(2,49)-(2,49)
[]
ListG (fromList [])

*)

(* type error slice
(2,25)-(2,49)
(2,39)-(2,49)
(2,49)-(2,49)
*)
