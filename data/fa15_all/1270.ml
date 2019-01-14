
let rec listReverse l =
  let newList = [] in
  match l with
  | [] -> newList
  | head::tail -> (listReverse tail) :: newList :: head;;


(* fix

let rec listReverse l =
  match l with
  | [] -> []
  | head::[] -> [head]
  | head::tail -> (listReverse tail) @ [head];;

*)

(* changed spans
(4,2)-(6,55)
match l with
| [] -> []
| head :: [] -> [head]
| head :: tail -> listReverse tail @ [head]
CaseG VarG (fromList [(Nothing,AppG (fromList [EmptyG])),(Nothing,ListG EmptyG Nothing)])

(6,18)-(6,36)
head
VarG

(6,18)-(6,36)
(@)
VarG

(6,18)-(6,36)
listReverse tail @ [head]
AppG (fromList [AppG (fromList [EmptyG]),ListG EmptyG Nothing])

(6,18)-(6,36)
[head]
ListG VarG Nothing

(6,18)-(6,55)
[]
ListG EmptyG Nothing

(6,40)-(6,47)
[head]
ListG VarG Nothing

*)
