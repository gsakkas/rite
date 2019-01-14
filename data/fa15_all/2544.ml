
let rec clone x n = if n <= 0 then [] else x :: ((x clone x n) - 1);;


(* fix

let rec clone x n = if n <= 0 then [] else clone x (n - 1);;

*)

(* changed spans
(2,50)-(2,51)
clone x (n - 1)
AppG (fromList [VarG,BopG EmptyG EmptyG])

(2,60)-(2,61)
n - 1
BopG VarG LitG

*)
