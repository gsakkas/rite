
let rec digitsOfInt n = if n < 0 then [];;


(* fix

let rec digitsOfInt n = if n < 0 then [] else [1];;

*)

(* changed spans
(2,41)-(2,41)
[1]
ListG (fromList [LitG])

*)

(* type error slice
(2,25)-(2,41)
(2,39)-(2,41)
(2,41)-(2,41)
*)
