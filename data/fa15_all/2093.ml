
let rec clone x n = if n = 0 then [] else x :: (clone ((x n) - 1));;


(* fix

let rec clone x n = if n = 0 then [] else x :: (clone x (n - 1));;

*)

(* changed spans
(2,47)-(2,66)
clone x (n - 1)
AppG (fromList [VarG,BopG EmptyG EmptyG])

(2,58)-(2,59)
n - 1
BopG VarG LitG

*)
