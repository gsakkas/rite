
let rec clone x n = match n with | 0 -> [] | _ -> [clone x];;


(* fix

let rec clone x n = match n with | 0 -> [] | n -> [x] @ (clone x (n - 1));;

*)

(* changed spans
(2,21)-(2,60)
match n with
| 0 -> []
| n -> [x] @ clone x (n - 1)
CaseG VarG (fromList [(VarPatG,Nothing,AppG (fromList [EmptyG])),(LitPatG,Nothing,ListG (fromList []))])

*)

(* type error slice
(2,4)-(2,62)
(2,15)-(2,60)
(2,17)-(2,60)
(2,21)-(2,60)
(2,51)-(2,60)
(2,52)-(2,57)
(2,52)-(2,59)
*)
