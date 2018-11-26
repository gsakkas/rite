
let rec assoc (d,k,l) =
  match k with | [] -> d | (lk,lv)::ls -> if k = lk then lv else assoc d k ls;;


(* fix

let rec assoc (d,k,l) =
  match l with
  | [] -> d
  | (lk,lv)::ls -> if k = lk then lv else assoc (d, k, ls);;

*)

(* changed spans
(3,8)-(3,9)
l
VarG

(3,65)-(3,77)
assoc (d , k , ls)
AppG (fromList [TupleG (fromList [EmptyG])])

(3,71)-(3,72)
(d , k , ls)
TupleG (fromList [VarG])

*)
