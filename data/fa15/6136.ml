
let rec assoc (d,k,l) =
  match (d, k, l) with | (k,_) -> k | h::t -> assoc (d, k, t) | _ -> d;;


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

(* all spans
(2,15)-(3,70)
(3,2)-(3,70)
(3,8)-(3,17)
(3,9)-(3,10)
(3,12)-(3,13)
(3,15)-(3,16)
(3,34)-(3,35)
(3,46)-(3,61)
(3,46)-(3,51)
(3,52)-(3,61)
(3,53)-(3,54)
(3,56)-(3,57)
(3,59)-(3,60)
(3,69)-(3,70)
*)
