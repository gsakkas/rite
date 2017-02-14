
let rec assoc (d,k,l) =
  match k with | [] -> d | h::t -> if k = h then h else assoc d k t;;


(* fix

let rec assoc (d,k,l) =
  match l with
  | [] -> d
  | h::t -> let (f,s) = h in if k = f then s else assoc (d, k, t);;

*)

(* changed spans
(3,9)-(3,10)
(3,36)-(3,68)
(3,43)-(3,44)
(3,50)-(3,51)
(3,57)-(3,62)
(3,57)-(3,68)
(3,63)-(3,64)
*)

(* type error slice
(3,3)-(3,68)
(3,3)-(3,68)
(3,9)-(3,10)
(3,39)-(3,40)
(3,39)-(3,44)
(3,39)-(3,44)
(3,43)-(3,44)
*)
