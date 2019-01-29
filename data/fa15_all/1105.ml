
let rec digitsOfInt n = match n <= 0 with | true  -> [] | false  -> 1;;


(* fix

let rec digitsOfInt n = match n <= 0 with | true  -> [] | false  -> [];;

*)

(* changed spans
(2,68)-(2,69)
[]
ListG EmptyG Nothing

*)
