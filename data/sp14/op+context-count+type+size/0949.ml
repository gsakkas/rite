
let rec assoc (d,k,l) =
  match l with
  | [] -> d
  | h::t -> if (fst h) = k then snd h else assoc (d k t);;


(* fix

let rec assoc (d,k,l) =
  match l with
  | [] -> d
  | h::t -> if (fst h) = k then snd h else assoc (d, k, t);;

*)

(* changed spans
(5,51)-(5,56)
*)

(* type error slice
(3,3)-(5,56)
(3,3)-(5,56)
(3,3)-(5,56)
(3,3)-(5,56)
(4,11)-(4,12)
(5,13)-(5,56)
(5,33)-(5,36)
(5,33)-(5,38)
(5,37)-(5,38)
(5,51)-(5,52)
(5,51)-(5,56)
(5,55)-(5,56)
*)
