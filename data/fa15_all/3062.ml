
let bigMul l1 l2 =
  let f a x = a :: 0 in
  let base = [] in let args = l2 in List.fold_left f base args;;


(* fix

let bigMul l1 l2 =
  let f a x = a @ [0] in
  let base = [] in let args = l2 in List.fold_left f base args;;

*)

(* changed spans
(3,14)-(3,15)
(@)
VarG

(3,14)-(3,20)
a @ [0]
AppG (fromList [VarG,ListG EmptyG Nothing])

(3,19)-(3,20)
[0]
ListG LitG Nothing

*)
