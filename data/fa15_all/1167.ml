
let rec listReverse l =
  match l with | [] -> [] | a::b -> [listReverse b; [a]];;


(* fix

let rec listReverse l = match l with | [] -> [] | b::[] -> [b];;

*)

(* changed spans
(3,2)-(3,56)
match l with
| [] -> []
| b :: [] -> [b]
CaseG VarG (fromList [(Nothing,ListG EmptyG Nothing)])

(3,53)-(3,54)
b
VarG

*)
