
let rec assoc (d,k,l) =
  match l with
  | [] -> d
  | ((s,i) as h)::t -> if s = k then i else assoc (d k t);;


(* fix

let rec assoc (d,k,l) =
  match l with
  | [] -> d
  | h::t -> if (fst h) = k then snd h else assoc (d, k, t);;

*)

(* changed spans
(3,3)-(5,57)
(5,27)-(5,28)
(5,31)-(5,32)
(5,38)-(5,39)
(5,45)-(5,50)
(5,52)-(5,53)
(5,52)-(5,57)
(5,54)-(5,55)
(5,56)-(5,57)
*)

(* type error slice
(3,3)-(5,57)
(3,3)-(5,57)
(3,3)-(5,57)
(3,3)-(5,57)
(4,11)-(4,12)
(5,24)-(5,57)
(5,38)-(5,39)
(5,52)-(5,53)
(5,52)-(5,57)
(5,56)-(5,57)
*)
