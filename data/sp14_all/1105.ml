
let rec digitsOfInt n = match n <= 0 with | true  -> [] | false  -> 1;;


(* fix

let rec digitsOfInt n = match n <= 0 with | true  -> [] | false  -> [];;

*)

(* changed spans
(2,69)-(2,70)
[]
ListG (fromList [])

*)

(* type error slice
(2,25)-(2,70)
(2,54)-(2,56)
(2,69)-(2,70)
*)
