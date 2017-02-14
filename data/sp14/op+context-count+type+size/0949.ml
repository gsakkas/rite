
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
(5,49)-(5,56)
*)

(* type error slice
(3,2)-(5,56)
(3,2)-(5,56)
(3,2)-(5,56)
(3,2)-(5,56)
(4,10)-(4,11)
(5,12)-(5,56)
(5,32)-(5,35)
(5,32)-(5,37)
(5,36)-(5,37)
(5,49)-(5,56)
(5,50)-(5,51)
(5,54)-(5,55)
*)
