
let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ (sep ^ x) in
      let base = h in let l = t in List.fold_left f base l;;

let rec clone x n = sepConcat ";" ((clone x n) - 1);;


(* fix

let rec clone x n = if n = 0 then [] else x :: (clone x (n - 1));;

*)

(* changed spans
(9,34)-(9,51)
if n = 0
then []
else x :: (clone x (n - 1))
IteG (BopG EmptyG EmptyG) (ListG EmptyG Nothing) (ConAppG (Just EmptyG) Nothing)

(9,35)-(9,46)
n
VarG

(9,35)-(9,46)
x
VarG

(9,35)-(9,46)
n = 0
BopG VarG LitG

(9,35)-(9,46)
0
LitG

(9,35)-(9,46)
x :: (clone x (n - 1))
ConAppG (Just (TupleG (fromList [VarG,AppG (fromList [VarG,BopG VarG LitG])]))) Nothing

(9,35)-(9,46)
[]
ListG EmptyG Nothing

(9,44)-(9,45)
n - 1
BopG VarG LitG

*)
