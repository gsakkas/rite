
let rec clone x n = match n with | 0 -> [] | _ -> x :: ((clone n) - 1);;


(* fix

let rec clone x n = match n with | 0 -> [] | _ -> x :: (clone x (n - 1));;

*)

(* changed spans
(2,56)-(2,65)
clone x (n - 1)
AppG (fromList [VarG,BopG EmptyG EmptyG])

(2,63)-(2,64)
x
VarG

(2,63)-(2,64)
n - 1
BopG VarG LitG

*)
