
let rec clone x n = match n with | 0 -> [] | n -> x :: (clone (x (n - 1)));;


(* fix

let rec clone x n = match n with | 0 -> [] | n -> x :: (clone x (n - 1));;

*)

(* changed spans
(2,55)-(2,74)
clone x (n - 1)
AppG (fromList [VarG,BopG EmptyG EmptyG])

*)
