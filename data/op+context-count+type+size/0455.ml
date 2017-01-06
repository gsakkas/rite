
let rec assoc (d,k,l) =
  match k with
  | [] -> d
  | (lk,lv)::ls -> if k = lk then lv else assoc (d, k, ls);;



let rec assoc (d,k,l) =
  match l with
  | [] -> d
  | (lk,lv)::ls -> if k = lk then lv else assoc (d, k, ls);;


(* changed spans
(3,9)-(3,10)
*)

(* type error slice
(3,3)-(5,58)
(5,23)-(5,29)
*)
