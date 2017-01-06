
let rec assoc (d,k,l) =
  match l with | [] -> d | (lk,lv)::ls -> if k = lk then lv else assoc d k ls;;



let rec assoc (d,k,l) =
  match l with
  | [] -> d
  | (lk,lv)::ls -> if k = lk then lv else assoc (d, k, ls);;


(* changed spans
*)

(* type error slice
(3,66)-(3,78)
*)
