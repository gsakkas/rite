
let rec sumList xs =
  match sumList with | [] -> 0 | head::tail -> head + (sumList tail);;


(* fix

let rec sum list = match list with | [] -> 0 | head::tail -> head;;

let rec sumList xs = sum xs;;

*)

(* changed spans
(2,16)-(3,68)
fun list ->
  match list with
  | [] -> 0
  | head :: tail -> head
LamG (CaseG EmptyG (fromList [(Nothing,EmptyG)]))

(3,8)-(3,15)
list
VarG

(3,54)-(3,68)
fun xs -> sum xs
LamG (AppG (fromList [EmptyG]))

(3,63)-(3,67)
sum
VarG

*)
