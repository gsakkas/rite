
let rec length = function | [] -> 0 | _::l -> 1 + (length l);;

let rec sumList xs = if (length xs) = 0 then xs = 0;;


(* fix

let rec sum list = match list with | [] -> 0 | head::tail -> head;;

let rec sumList xs = sum xs;;

*)

(* changed spans
(2,17)-(2,60)
fun list ->
  match list with
  | [] -> 0
  | head :: tail -> head
LamG (CaseG EmptyG (fromList [(Nothing,EmptyG)]))

(2,34)-(2,35)
list
VarG

(2,34)-(2,35)
match list with
| [] -> 0
| head :: tail -> head
CaseG VarG (fromList [(Nothing,VarG),(Nothing,LitG)])

(2,58)-(2,59)
head
VarG

(4,45)-(4,51)
sum
VarG

*)
