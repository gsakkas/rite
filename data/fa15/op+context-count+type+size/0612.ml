
let rec assoc (d,k,l) =
  match (d, k, l) with
  | (ki,vi)::t -> if k = ki then vi else assoc (d, k, t)
  | [] -> d;;


(* fix

let rec assoc (d,k,l) =
  match l with
  | (ki,vi)::t -> if k = ki then vi else assoc (d, k, t)
  | [] -> d;;

*)

(* changed spans
(3,8)-(3,17)
(3,9)-(3,10)
(3,12)-(3,13)
*)

(* type error slice
(3,2)-(5,11)
(3,2)-(5,11)
(3,2)-(5,11)
(3,2)-(5,11)
(3,8)-(3,17)
*)
