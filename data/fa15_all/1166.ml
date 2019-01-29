
let rec listReverse l = match l with | [] -> [] | a::b -> [listReverse b; a];;


(* fix

let rec listReverse l = match l with | [] -> [] | b::[] -> [b];;

*)

(* changed spans
(2,24)-(2,76)
match l with
| [] -> []
| b :: [] -> [b]
CaseG VarG (fromList [(Nothing,ListG EmptyG Nothing)])

(2,59)-(2,70)
[b]
ListG VarG Nothing

*)
