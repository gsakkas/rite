
let rec assoc (d,k,l) =
  match k with
  | [] -> d
  | (lk,lv)::ls ->
      if k = lk then lv else assoc d k ls uncomment after implementing assoc;;



let rec assoc (d,k,l) =
  match l with
  | [] -> d
  | (lk,lv)::ls -> if k = lk then lv else assoc (d, k, ls);;


(* changed spans
(3,9)-(3,10)
(6,43)-(6,77)
*)

(* type error slice
*)
