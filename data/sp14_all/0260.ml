
let rec digitsOfInt n = match n with | [] -> [] | _ -> if n < 0 then [];;


(* fix

let rec digitsOfInt n = match n with | _ when n < 0 -> [];;

*)

(* changed spans
(2,25)-(2,72)
match n with
| _ when n < 0 -> []
CaseG VarG (fromList [(WildPatG,Just (BopG VarG LitG),ListG (fromList []))])

*)

(* type error slice
(2,25)-(2,72)
(2,31)-(2,32)
(2,56)-(2,72)
(2,59)-(2,60)
(2,59)-(2,64)
(2,63)-(2,64)
(2,70)-(2,72)
(2,72)-(2,72)
*)
