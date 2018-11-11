
let rec digitsOfInt n = match n with | [] -> [] | h::t -> if n < 0 then [];;


(* fix

let rec digitsOfInt n = match n with | _ when n < 0 -> [];;

*)

(* changed spans
(2,61)-(2,66)
match n with
| _ when n < 0 -> []
CaseG VarG [(Just (BopG EmptyG EmptyG),ListG EmptyG Nothing)]

*)
