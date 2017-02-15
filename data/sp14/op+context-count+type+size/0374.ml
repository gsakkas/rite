
let rec assoc (d,k,l) =
  match k with
  | [] -> d
  | (lk,lv)::ls -> if lk = lk then lv else assoc d k ls;;


(* fix

let rec assoc (d,k,l) =
  match l with
  | [] -> d
  | (lk,lv)::ls -> if k = lk then lv else assoc (d, k, ls);;

*)

(* changed spans
(3,8)-(3,9)
(5,22)-(5,24)
(5,43)-(5,55)
(5,49)-(5,50)
*)

(* type error slice
(2,3)-(5,57)
(2,15)-(5,55)
(5,43)-(5,48)
(5,43)-(5,55)
(5,49)-(5,50)
*)
