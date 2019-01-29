
let rec sumList xs = match xs with | [] -> 0 | h::t -> h + t;;


(* fix

let rec sumList xs = match xs with | [] -> 0;;

*)

(* changed spans
(2,21)-(2,60)
match xs with
| [] -> 0
CaseG VarG (fromList [(Nothing,LitG)])

*)
