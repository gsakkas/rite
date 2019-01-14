
let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ (sep ^ x) in
      let base = h in let l = t in List.fold_left f base l;;

let rec clone x n = "[" ^ ((sepConcat "; ") ^ ((List.append x n) ^ "]"));;


(* fix

let rec cloneHelper x n = if x <= 0 then [] else cloneHelper x (n - 1);;

let rec clone x n = cloneHelper x n;;

*)

(* changed spans
(6,18)-(6,19)
fun n ->
  if x <= 0
  then []
  else cloneHelper x (n - 1)
LamG (IteG EmptyG EmptyG EmptyG)

(6,22)-(6,31)
x
VarG

(6,22)-(6,31)
x <= 0
BopG VarG LitG

(6,22)-(6,31)
0
LitG

(6,22)-(6,31)
if x <= 0
then []
else cloneHelper x (n - 1)
IteG (BopG EmptyG EmptyG) (ListG EmptyG Nothing) (AppG (fromList [EmptyG]))

(6,22)-(6,31)
[]
ListG EmptyG Nothing

(6,23)-(6,26)
cloneHelper
VarG

(7,57)-(7,58)
n - 1
BopG VarG LitG

(9,14)-(9,72)
n
VarG

(9,14)-(9,72)
1
LitG

(9,48)-(9,59)
cloneHelper
VarG

*)
