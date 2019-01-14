
let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ (sep ^ x) in
      let base = h in let l = t in List.fold_left f base l;;

let pipe fs =
  let f a x n = x (a n) in let base n = n in List.fold_left f base fs;;

let stringOfList f l = "[" ^ ((sepConcat "; " (List.map f l)) ^ "]");;

let rec clone x n = pipe stringOfList x n;;


(* fix

let rec cloneHelper x n = if x <= 0 then [] else cloneHelper x (n - 1);;

let rec clone x n = cloneHelper x n;;

*)

(* changed spans
(10,16)-(10,17)
x <= 0
BopG VarG LitG

(10,16)-(10,23)
if x <= 0
then []
else cloneHelper x (n - 1)
IteG (BopG EmptyG EmptyG) (ListG EmptyG Nothing) (AppG (fromList [EmptyG]))

(12,41)-(12,45)
0
LitG

(12,46)-(12,60)
[]
ListG EmptyG Nothing

(12,64)-(12,67)
cloneHelper
VarG

(14,14)-(14,41)
x
VarG

(14,14)-(14,41)
n
VarG

(14,14)-(14,41)
n - 1
BopG VarG LitG

(14,14)-(14,41)
1
LitG

(14,25)-(14,37)
cloneHelper x n
AppG (fromList [VarG])

(14,38)-(14,39)
cloneHelper
VarG

*)
