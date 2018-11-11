
let rec sumList xs = if (xs :: 1) = 1 then 0;;


(* fix

let rec sum list = match list with | [] -> 0 | head::tail -> head;;

let rec sumList xs = sum xs;;

*)

(* changed spans
(2,16)-(2,44)
list
VarG

(2,16)-(2,44)
head
VarG

(2,16)-(2,44)
fun list ->
  match list with
  | [] -> 0
  | head :: tail -> head
LamG (CaseG EmptyG [(Nothing,EmptyG),(Nothing,EmptyG)])

(2,16)-(2,44)
0
LitG

(2,16)-(2,44)
match list with
| [] -> 0
| head :: tail -> head
CaseG VarG [(Nothing,LitG),(Nothing,VarG)]

(2,24)-(2,33)
sum xs
AppG [VarG]

(2,25)-(2,27)
sum
VarG

*)
