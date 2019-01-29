
let rec digitsOfInt n = match n with | [] -> [] | n -> if n > 0 then 0;;


(* fix

let rec digitsOfInt n = if n < 0 then [] else [];;

*)

(* changed spans
(2,55)-(2,70)
[]
ListG EmptyG Nothing

(2,58)-(2,63)
n < 0
BopG VarG LitG

*)
