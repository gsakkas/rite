
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

(* all spans
(2,15)-(3,77)
(3,2)-(3,77)
(3,8)-(3,9)
(3,23)-(3,24)
(3,42)-(3,77)
(3,45)-(3,51)
(3,45)-(3,46)
(3,49)-(3,51)
(3,57)-(3,59)
(3,65)-(3,77)
(3,65)-(3,70)
(3,71)-(3,72)
(3,73)-(3,74)
(3,75)-(3,77)
*)
