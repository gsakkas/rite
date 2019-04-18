
let rec digitsOfInt n = if n < 0 then [];;


(* fix

let rec digitsOfInt n = [];;

*)

(* changed spans
(2,25)-(2,41)
[]
ListG (fromList [])

*)

(* type error slice
(2,25)-(2,41)
(2,39)-(2,41)
(2,41)-(2,41)
*)
