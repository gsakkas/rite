
let sqsum xs =
  let f a x = match x with | [] -> a | x::t -> x * x in
  let base = [] in List.fold_left f base xs;;


(* fix

let sqsum xs =
  let f a x = match x with | 0 -> a | x -> x * x in
  let base = 0 in List.fold_left f base xs;;

*)

(* changed spans
(3,14)-(3,52)
match x with
| 0 -> a
| x -> x * x
CaseG VarG (fromList [(Nothing,VarG),(Nothing,BopG EmptyG EmptyG)])

(4,13)-(4,15)
0
LitG

*)
