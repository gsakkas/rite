
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
(3,10)-(3,11)
(3,10)-(3,17)
(3,13)-(3,14)
*)

(* type error slice
(3,3)-(5,12)
(3,3)-(5,12)
(3,3)-(5,12)
(3,3)-(5,12)
(3,10)-(3,17)
*)
