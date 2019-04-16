
let rec assoc (d,k,l) =
  match l with | [] -> d | (lk,lv)::ls -> if k = lk then lv else assoc d k ls;;


(* fix

let rec assoc (d,k,l) =
  match l with
  | [] -> d
  | (lk,lv)::ls -> if k = lk then lv else assoc (d, k, ls);;

*)

(* changed spans
(3,66)-(3,78)
assoc (d , k , ls)
AppG (fromList [TupleG (fromList [EmptyG])])

*)

(* type error slice
(2,4)-(3,80)
(2,16)-(3,78)
(3,66)-(3,71)
(3,66)-(3,78)
(3,72)-(3,73)
*)
