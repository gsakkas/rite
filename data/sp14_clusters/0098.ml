
let rec clone x n = match n with | 0 -> [] | h::t -> x :: (clone x (n - 1));;


(* fix

let rec clone x n = match n with | 0 -> [] | _ -> x :: (clone x (n - 1));;

*)

(* changed spans
(2,20)-(2,75)
match n with
| 0 -> []
| _ -> x :: (clone x (n - 1))
CaseG VarG [(Nothing,ListG EmptyG Nothing),(Nothing,ConAppG (Just EmptyG) Nothing)]

*)
