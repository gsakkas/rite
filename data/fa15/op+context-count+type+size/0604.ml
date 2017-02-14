
let rec assoc (d,k,l) =
  match l with
  | [] -> d
  | h::l' -> (match h with | (a,b) -> if a = k then b assoc (d, k, l'));;


(* fix

let rec assoc (d,k,l) =
  match l with
  | [] -> d
  | h::l' -> (match h with | (a,b) -> if a = k then b else assoc (d, k, l'));;

*)

(* changed spans
(5,39)-(5,70)
(5,53)-(5,70)
(5,55)-(5,60)
*)

(* type error slice
(3,3)-(5,70)
(3,3)-(5,70)
(5,15)-(5,70)
(5,21)-(5,22)
(5,53)-(5,54)
(5,53)-(5,70)
(5,62)-(5,70)
(5,68)-(5,70)
*)
