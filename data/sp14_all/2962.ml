
let rec digitsOfInt n =
  if n > 0 then ((digitsOfInt n) / 10) @ [n mod 10] else [];;


(* fix

let rec digitsOfInt n = if n > 0 then [2] else [1];;

*)

(* changed spans
(3,17)-(3,52)
[2]
ListG (fromList [LitG])

(3,58)-(3,60)
[1]
ListG (fromList [LitG])

*)

(* type error slice
(2,4)-(3,62)
(2,21)-(3,60)
(3,3)-(3,60)
(3,17)-(3,39)
(3,17)-(3,52)
(3,18)-(3,33)
(3,19)-(3,30)
(3,40)-(3,41)
(3,58)-(3,60)
*)
