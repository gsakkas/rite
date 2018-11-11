
let rec clone x n = match n with | 0 -> [] | h::t -> x :: ((clone x n) - 1);;


(* fix

let rec clone x n = if n < 1 then [] else x :: (clone x (n - 1));;

*)

(* changed spans
(2,20)-(2,75)
if n < 1
then []
else x :: (clone x (n - 1))
IteG (BopG EmptyG EmptyG) (ListG EmptyG Nothing) (ConAppG (Just EmptyG) Nothing)

(2,26)-(2,27)
n < 1
BopG VarG LitG

(2,40)-(2,42)
1
LitG

(2,68)-(2,69)
n - 1
BopG VarG LitG

*)
