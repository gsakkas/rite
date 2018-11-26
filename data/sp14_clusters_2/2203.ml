
let rec clone x n = if n > 0 then x :: (clone (x (n - 1))) else [];;


(* fix

let rec clone x n = if n < 1 then [] else x :: (clone x (n - 1));;

*)

(* changed spans
(2,23)-(2,28)
n < 1
BopG VarG LitG

(2,27)-(2,28)
1
LitG

(2,34)-(2,58)
[]
ListG EmptyG Nothing

(2,39)-(2,58)
clone x (n - 1)
AppG (fromList [VarG,BopG EmptyG EmptyG])

*)
