
let rec assoc (d,k,l) =
  match l with
  | [] -> d
  | h::t -> let (a,b) = h in if a = k then b else assoc t;;


(* fix

let rec assoc (d,k,l) =
  match l with
  | [] -> d
  | h::t -> let (a,b) = h in if a = k then b else assoc (d, k, t);;

*)

(* changed spans
(5,56)-(5,57)
*)

(* type error slice
(2,3)-(5,59)
(2,15)-(5,57)
(3,2)-(5,57)
(3,2)-(5,57)
(3,8)-(3,9)
(5,50)-(5,55)
(5,50)-(5,57)
(5,56)-(5,57)
*)
