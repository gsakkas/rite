
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
(3,8)-(3,9)
*)

(* type error slice
(3,2)-(5,58)
(3,8)-(3,9)
(5,22)-(5,23)
(5,22)-(5,28)
(5,26)-(5,28)
*)

(* all spans
(2,15)-(5,58)
(3,2)-(5,58)
(3,8)-(3,9)
(4,10)-(4,11)
(5,19)-(5,58)
(5,22)-(5,28)
(5,22)-(5,23)
(5,26)-(5,28)
(5,34)-(5,36)
(5,42)-(5,58)
(5,42)-(5,47)
(5,48)-(5,58)
(5,49)-(5,50)
(5,52)-(5,53)
(5,55)-(5,57)
*)
