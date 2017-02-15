
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
(5,38)-(5,70)
(5,52)-(5,70)
(5,54)-(5,59)
*)

(* type error slice
(3,2)-(5,71)
(3,2)-(5,71)
(5,13)-(5,71)
(5,20)-(5,21)
(5,52)-(5,53)
(5,52)-(5,70)
(5,60)-(5,70)
(5,67)-(5,69)
*)
