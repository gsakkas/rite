
let rec clone x n = match n with | 0 -> [] | _ -> x :: (clone ((x n) - 1));;


(* fix

let rec clone x n = match n with | 0 -> [] | _ -> x :: (clone x (n - 1));;

*)

(* changed spans
(2,55)-(2,74)
clone x (n - 1)
AppG (fromList [VarG,BopG EmptyG EmptyG])

(2,66)-(2,67)
n - 1
BopG VarG LitG

*)
