
let rec listReverse l =
  match l with | [] -> [] | a::b::[] -> (listReverse b) @ a;;


(* fix

let rec listReverse l =
  match l with | [] -> [] | a::b -> (listReverse b) @ [a];;

*)

(* changed spans
(3,2)-(3,59)
match l with
| [] -> []
| a :: b -> listReverse b @ [a]
CaseG VarG [(Nothing,ListG EmptyG Nothing),(Nothing,AppG [EmptyG,EmptyG])]

(3,58)-(3,59)
[a]
ListG VarG Nothing

*)
