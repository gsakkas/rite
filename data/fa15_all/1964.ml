
let rec clone x n =
  if n > 0 then match x with | h::t -> [h] @ (clone t (n - 1));;


(* fix

let rec clone x n = if n = 0 then [] else x :: (clone x (n - 1));;

*)

(* changed spans
(3,5)-(3,10)
n = 0
BopG VarG LitG

(3,16)-(3,62)
[]
ListG EmptyG Nothing

(3,22)-(3,23)
x :: (clone x (n - 1))
ConAppG (Just (TupleG (fromList [VarG,AppG (fromList [VarG,BopG VarG LitG])]))) Nothing

(3,52)-(3,53)
x
VarG

*)
