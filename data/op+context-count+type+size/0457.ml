
let rec assoc (d,k,l) =
  match k with
  | [] -> d
  | (lk,lv)::ls -> if lk = lk then lv else assoc d k ls;;



let rec assoc (d,k,l) =
  match l with
  | [] -> d
  | (lk,lv)::ls -> if k = lk then lv else assoc (d, k, ls);;


(* changed spans
(3,9)-(3,10)
(5,23)-(5,25)
*)

(* type error slice
(5,44)-(5,56)
*)
