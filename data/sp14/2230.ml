
let rec assoc (d,k,l) =
  match k with
  | [] -> d
  | (lk,lv)::ls -> if k = lk then lv else assoc (d, k, ls);;


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

*)

(* type error slice
(3,3)-(5,59)
(3,9)-(3,10)
(5,23)-(5,24)
(5,23)-(5,29)
(5,27)-(5,29)
*)
