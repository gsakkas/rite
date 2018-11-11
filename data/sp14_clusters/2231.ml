
let rec assoc (d,k,l) =
  match k with
  | [] -> d
  | (lk,lv)::ls -> if lk = lk then lv else assoc d k ls;;


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

(5,22)-(5,24)
k
VarG

(5,43)-(5,55)
assoc (d , k , ls)
AppG [TupleG [EmptyG,EmptyG,EmptyG]]

(5,49)-(5,50)
(d , k , ls)
TupleG [VarG,VarG,VarG]

*)
