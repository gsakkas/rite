
let rec assoc (d,k,l) =
  match (d, k, l) with | (k,_) -> d | h::t -> assoc (d, k, t) | _ -> d;;


(* fix

let rec assoc (d,k,l) =
  match l with
  | (ki,vi)::t -> if k = ki then vi else assoc (d, k, t)
  | [] -> d;;

*)

(* changed spans
(3,2)-(3,70)
(3,8)-(3,17)
(3,9)-(3,10)
(3,12)-(3,13)
(3,34)-(3,35)
(3,46)-(3,61)
*)

(* type error slice
(3,2)-(3,70)
(3,8)-(3,17)
*)
