
let rec digitsOfInt n = if n < 0 then [];;


(* fix

let rec digitsOfInt n = match n with | _ when n < 0 -> [];;

*)

(* changed spans
(2,25)-(2,41)
match n with
| _ when n < 0 -> []
CaseG (fromList [(WildPatG,Just (BopG VarG LitG),ListG (fromList []))])

*)

(* type error slice
(2,25)-(2,41)
(2,39)-(2,41)
(2,41)-(2,41)
*)
