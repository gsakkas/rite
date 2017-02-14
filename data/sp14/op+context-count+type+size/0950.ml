
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
(3,2)-(5,57)
(5,26)-(5,27)
(5,30)-(5,31)
(5,37)-(5,38)
(5,44)-(5,49)
(5,50)-(5,57)
(5,51)-(5,52)
(5,53)-(5,54)
(5,55)-(5,56)
*)

(* type error slice
(3,2)-(5,57)
(3,2)-(5,57)
(3,2)-(5,57)
(3,2)-(5,57)
(4,10)-(4,11)
(5,23)-(5,57)
(5,37)-(5,38)
(5,50)-(5,57)
(5,51)-(5,52)
(5,55)-(5,56)
*)
