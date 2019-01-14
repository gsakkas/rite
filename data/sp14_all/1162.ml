
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
CaseG VarG (fromList [(Nothing,AppG (fromList [EmptyG])),(Nothing,ListG EmptyG Nothing)])

(3,58)-(3,59)
[a]
ListG VarG Nothing

*)
