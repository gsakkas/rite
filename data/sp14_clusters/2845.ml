
let rec sumList xs = match sumList with | head::tail -> head + (sumList tail);;


(* fix

let rec sum list = match list with | [] -> 0 | head::tail -> head;;

let rec sumList xs = sum xs;;

*)

(* changed spans
(2,56)-(2,60)
list
VarG

(2,56)-(2,60)
0
LitG

(2,56)-(2,60)
match list with
| [] -> 0
| head :: tail -> head
CaseG VarG [(Nothing,LitG),(Nothing,VarG)]

(2,56)-(2,77)
fun list ->
  match list with
  | [] -> 0
  | head :: tail -> head
LamG (CaseG EmptyG [(Nothing,EmptyG),(Nothing,EmptyG)])

(2,63)-(2,77)
fun xs -> sum xs
LamG (AppG [EmptyG])

(2,72)-(2,76)
sum
VarG

*)
