
let rec assoc (d,k,l) =
  match k with | [] -> d | (lk,lv)::ls -> if k = lk then lv else assoc d k ls;;


(* fix

let rec assoc (d,k,l) =
  match l with
  | [] -> d
  | (lk,lv)::ls -> if k = lk then lv else assoc (d, k, ls);;

*)

(* changed spans
(3,9)-(3,10)
(3,66)-(3,78)
(3,72)-(3,73)
*)

(* type error slice
(3,3)-(3,78)
(3,3)-(3,78)
(3,9)-(3,10)
(3,46)-(3,47)
(3,46)-(3,52)
(3,46)-(3,52)
(3,50)-(3,52)
*)
