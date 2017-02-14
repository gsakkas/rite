
let rec assoc (d,k,l) =
  match (d, k, l) with | (k,_) -> k | h::t -> assoc (d, k, t) | _ -> d;;


(* fix

let rec assoc (d,k,l) =
  match l with
  | (ki,vi)::t -> if k = ki then vi else assoc (d, k, t)
  | [] -> d;;

*)

(* changed spans
(3,3)-(3,71)
(3,10)-(3,11)
(3,10)-(3,17)
(3,13)-(3,14)
(3,35)-(3,36)
(3,47)-(3,61)
*)

(* type error slice
(3,3)-(3,71)
(3,10)-(3,17)
*)
