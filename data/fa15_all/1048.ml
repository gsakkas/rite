
let rec clone x n = match n with | 0 -> [] | _ -> (clone (x, (n - 1))) :: x;;


(* fix

let helper (x,m) = x :: m;;

let rec clone x n = match n with | 0 -> [] | _ -> helper (x, (clone x n));;

*)

(* changed spans
(2,14)-(2,75)
x
VarG

(2,14)-(2,75)
m
VarG

(2,14)-(2,75)
fun (x , m) -> x :: m
LamG (ConAppG (Just (TupleG (fromList [VarG]))) Nothing)

(2,14)-(2,75)
x :: m
ConAppG (Just (TupleG (fromList [VarG]))) Nothing

(2,51)-(2,56)
helper
VarG

(2,66)-(2,67)
clone x n
AppG (fromList [VarG])

(2,74)-(2,75)
clone
VarG

*)
