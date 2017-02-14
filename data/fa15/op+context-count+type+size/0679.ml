
let rec assoc (d,k,l) =
  match (d, k, l) with
  | (str,num)::t -> if str = k then num else assoc (d, k, t)
  | [] -> d;;


(* fix

let rec assoc (d,k,l) =
  match l with
  | (ki,vi)::t -> if k = ki then vi else assoc (d, k, t)
  | [] -> d;;

*)

(* changed spans
(3,3)-(5,12)
(3,10)-(3,11)
(3,10)-(3,17)
(3,13)-(3,14)
(4,24)-(4,27)
(4,37)-(4,40)
(4,46)-(4,60)
*)

(* type error slice
(3,3)-(5,12)
(3,3)-(5,12)
(3,3)-(5,12)
(3,3)-(5,12)
(3,10)-(3,17)
*)
