
let rec assoc (d,k,l) =
  match l with | [] -> d | (lk,lv)::ls -> if k = lk then lv else assoc d k ls;;


(* fix

let rec assoc (d,k,l) =
  match l with
  | [] -> d
  | (lk,lv)::ls -> if k = lk then lv else assoc (d, k, ls);;

*)

(* changed spans
(3,65)-(3,77)
(3,71)-(3,72)
*)

(* type error slice
(2,3)-(3,79)
(2,15)-(3,77)
(3,65)-(3,70)
(3,65)-(3,77)
(3,71)-(3,72)
*)
