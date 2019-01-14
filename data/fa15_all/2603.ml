
let rec digitsOfInt n =
  if n < 0
  then []
  else (match n with | [] -> [] | h::t -> h @ [digitsOfInt t]);;


(* fix

let rec digitsOfInt n = if n < 0 then [] else (match n with | 0 -> []);;

*)

(* changed spans
(5,7)-(5,62)
match n with
| 0 -> []
CaseG VarG (fromList [(Nothing,ListG EmptyG Nothing)])

*)
