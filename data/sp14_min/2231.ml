
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
(3,9)-(3,10)
l
VarG

(5,23)-(5,25)
k
VarG

(5,44)-(5,56)
assoc (d , k , ls)
AppG [TupleG [EmptyG,EmptyG,EmptyG]]

*)

(* type error slice
(2,4)-(5,58)
(2,16)-(5,56)
(5,44)-(5,49)
(5,44)-(5,56)
(5,50)-(5,51)
*)
