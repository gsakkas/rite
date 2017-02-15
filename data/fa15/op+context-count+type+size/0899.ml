
let rec assoc (d,k,l) =
  match l with
  | [] -> d
  | h::t -> let (f,s) = h in if k = f then s h else assoc d k t;;


(* fix

let rec assoc (d,k,l) =
  match l with
  | [] -> d
  | h::t -> let (f,s) = h in if k = f then s else assoc (d, k, t);;

*)

(* changed spans
(5,43)-(5,46)
(5,45)-(5,46)
(5,52)-(5,63)
(5,58)-(5,59)
*)

(* type error slice
(2,3)-(5,65)
(2,15)-(5,63)
(5,12)-(5,63)
(5,24)-(5,25)
(5,43)-(5,44)
(5,43)-(5,46)
(5,45)-(5,46)
(5,52)-(5,57)
(5,52)-(5,63)
(5,58)-(5,59)
*)
