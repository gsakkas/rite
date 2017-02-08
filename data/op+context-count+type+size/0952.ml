
let rec assoc (d,k,l) =
  match l with | [] -> d | (s,i)::t -> if s = k then i else assoc (d k t);;


(* fix

let rec assoc (d,k,l) =
  match l with
  | [] -> d
  | h::t -> if (fst h) = k then snd h else assoc (d, k, t);;

*)

(* changed spans
(3,3)-(3,73)
(3,43)-(3,44)
(3,47)-(3,48)
(3,54)-(3,55)
(3,61)-(3,66)
(3,68)-(3,69)
(3,68)-(3,73)
(3,70)-(3,71)
(3,72)-(3,73)
*)

(* type error slice
(3,3)-(3,73)
(3,3)-(3,73)
(3,3)-(3,73)
(3,3)-(3,73)
(3,24)-(3,25)
(3,40)-(3,73)
(3,54)-(3,55)
(3,68)-(3,69)
(3,68)-(3,73)
(3,72)-(3,73)
*)
