
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
CaseG VarG [(Nothing,ListG EmptyG Nothing),(Nothing,AppG [EmptyG,EmptyG])]

(3,55)-(3,56)
listReverse b @ [a]
AppG [AppG [EmptyG],ListG EmptyG Nothing]

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
