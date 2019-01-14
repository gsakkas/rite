
let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ (sep ^ x) in
      let base = h in let l = t in List.fold_left f base l;;

let stringOfList f l = "[" ^ ((sepConcat "; " (List.map f l)) ^ "]");;

let rec clone x n = stringOfList x n List.map x n;;


(* fix

let rec cloneHelper x n = if x <= 0 then [] else cloneHelper x (n - 1);;

let rec clone x n = cloneHelper x n;;

*)

(* changed spans
(6,23)-(6,26)
fun n ->
  if x <= 0
  then []
  else cloneHelper x (n - 1)
LamG (IteG EmptyG EmptyG EmptyG)

(6,29)-(6,30)
x <= 0
BopG VarG LitG

(6,29)-(6,30)
if x <= 0
then []
else cloneHelper x (n - 1)
IteG (BopG EmptyG EmptyG) (ListG EmptyG Nothing) (AppG (fromList [EmptyG]))

(9,41)-(9,45)
0
LitG

(9,46)-(9,60)
[]
ListG EmptyG Nothing

(11,20)-(11,32)
cloneHelper
VarG

(11,35)-(11,36)
n - 1
BopG VarG LitG

(11,37)-(11,45)
1
LitG

(11,46)-(11,47)
cloneHelper
VarG

(11,46)-(11,47)
fun x ->
  fun n -> cloneHelper x n
LamG (LamG EmptyG)

(11,46)-(11,47)
fun n -> cloneHelper x n
LamG (AppG (fromList [EmptyG]))

(11,46)-(11,47)
cloneHelper x n
AppG (fromList [VarG])

*)
