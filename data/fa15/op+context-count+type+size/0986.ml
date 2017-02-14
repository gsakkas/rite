
let rec assoc (d,k,l) =
  match l with
  | [] -> d
  | h::t -> let (f,s) = h in if k = f then s else assoc d k t;;


(* fix

let rec assoc (d,k,l) =
  match l with
  | [] -> d
  | h::t -> let (f,s) = h in if k = f then s else assoc (d, k, t);;

*)

(* changed spans
(5,50)-(5,61)
(5,56)-(5,57)
*)

(* type error slice
(2,3)-(5,63)
(2,15)-(5,61)
(5,50)-(5,55)
(5,50)-(5,61)
(5,56)-(5,57)
*)
