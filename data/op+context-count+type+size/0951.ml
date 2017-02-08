
let rec assoc (d,k,l) =
  match l with | [] -> d | (s,i)::t -> if s = k then true else assoc (d k t);;


(* fix

let rec assoc (d,k,l) =
  match l with
  | [] -> d
  | h::t -> if (fst h) = k then snd h else assoc (d, k, t);;

*)

(* changed spans
(3,3)-(3,76)
(3,43)-(3,44)
(3,47)-(3,48)
(3,54)-(3,58)
(3,64)-(3,69)
(3,71)-(3,72)
(3,71)-(3,76)
(3,73)-(3,74)
(3,75)-(3,76)
*)

(* type error slice
(3,3)-(3,76)
(3,3)-(3,76)
(3,24)-(3,25)
(3,40)-(3,76)
(3,54)-(3,58)
(3,71)-(3,72)
(3,71)-(3,76)
*)
