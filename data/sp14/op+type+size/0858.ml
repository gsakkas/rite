
let rec assoc (d,k,l) =
  match l with | [] -> d | (s,i)::t -> if s = k then i else assoc (d k t);;


(* fix

let rec assoc (d,k,l) =
  match l with
  | [] -> d
  | h::t -> if (fst h) = k then snd h else assoc (d, k, t);;

*)

(* changed spans
(3,2)-(3,73)
(3,42)-(3,43)
(3,46)-(3,47)
(3,53)-(3,54)
(3,60)-(3,65)
(3,66)-(3,73)
*)

(* type error slice
(3,2)-(3,73)
(3,2)-(3,73)
(3,2)-(3,73)
(3,2)-(3,73)
(3,23)-(3,24)
(3,39)-(3,73)
(3,53)-(3,54)
(3,66)-(3,73)
(3,67)-(3,68)
(3,71)-(3,72)
*)

(* all spans
(2,15)-(3,73)
(3,2)-(3,73)
(3,8)-(3,9)
(3,23)-(3,24)
(3,39)-(3,73)
(3,42)-(3,47)
(3,42)-(3,43)
(3,46)-(3,47)
(3,53)-(3,54)
(3,60)-(3,73)
(3,60)-(3,65)
(3,66)-(3,73)
(3,67)-(3,68)
(3,69)-(3,70)
(3,71)-(3,72)
*)
