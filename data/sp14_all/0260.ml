
let rec digitsOfInt n = match n with | [] -> [] | _ -> if n < 0 then [];;


(* fix

let rec digitsOfInt n = match n with | _ when n < 0 -> [];;

*)

(* changed spans
(2,58)-(2,63)
match n with
| _ when n < 0 -> []
CaseG VarG (fromList [(Just (BopG EmptyG EmptyG),ListG EmptyG Nothing)])

*)
