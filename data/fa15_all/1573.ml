
let rec listReverse l =
  match l with | [] -> [] | (h::tail)::[] -> listReverse tail;;


(* fix

let rec listReverse l =
  match l with | [] -> [] | h::tail -> (listReverse tail) @ [h];;

*)

(* changed spans
(3,2)-(3,61)
match l with
| [] -> []
| h :: tail -> listReverse tail @ [h]
CaseG VarG (fromList [(Nothing,AppG (fromList [EmptyG])),(Nothing,ListG EmptyG Nothing)])

(3,45)-(3,61)
(@)
VarG

(3,45)-(3,61)
listReverse tail @ [h]
AppG (fromList [AppG (fromList [EmptyG]),ListG EmptyG Nothing])

*)
