
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
(3,65)-(3,77)
(3,71)-(3,72)
*)

(* type error slice
(3,2)-(3,77)
(3,2)-(3,77)
(3,8)-(3,9)
(3,45)-(3,46)
(3,45)-(3,51)
(3,45)-(3,51)
(3,49)-(3,51)
*)
