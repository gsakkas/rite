
let rec assoc (d,k,l) =
  match k with | [] -> d | h::t -> if k = h then h else assoc d k t;;


(* fix

let rec assoc (d,k,l) =
  match l with
  | [] -> d
  | h::t -> let (f,s) = h in if k = f then s else assoc (d, k, t);;

*)

(* changed spans
(3,8)-(3,9)
(3,35)-(3,67)
(3,42)-(3,43)
(3,49)-(3,50)
(3,56)-(3,61)
(3,56)-(3,67)
(3,62)-(3,63)
*)

(* type error slice
(3,2)-(3,67)
(3,2)-(3,67)
(3,8)-(3,9)
(3,38)-(3,39)
(3,38)-(3,43)
(3,38)-(3,43)
(3,42)-(3,43)
*)
