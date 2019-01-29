
let rec listReverse l =
  match l with | [] -> [] | a::[] -> [a] | a::b::[] -> b :: (listReverse a);;


(* fix

let rec listReverse l =
  match l with | [] -> [] | a::b -> (listReverse b) @ [a];;

*)

(* changed spans
(3,2)-(3,75)
match l with
| [] -> []
| a :: b -> listReverse b @ [a]
CaseG VarG (fromList [(Nothing,AppG (fromList [EmptyG])),(Nothing,ListG EmptyG Nothing)])

(3,55)-(3,56)
listReverse b @ [a]
AppG (fromList [AppG (fromList [EmptyG]),ListG EmptyG Nothing])

(3,60)-(3,75)
(@)
VarG

(3,73)-(3,74)
b
VarG

(3,73)-(3,74)
[a]
ListG VarG Nothing

*)
