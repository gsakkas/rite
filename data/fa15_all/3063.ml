
let bigMul l1 l2 =
  let f a x = a @ 0 in
  let base = [] in let args = l2 in List.fold_left f base args;;


(* fix

let bigMul l1 l2 =
  let f a x = a @ [0] in
  let base = [] in let args = l2 in List.fold_left f base args;;

*)

(* changed spans
(3,19)-(3,20)
[0]
ListG [LitG]

*)

(* type error slice
(3,15)-(3,20)
(3,17)-(3,18)
(3,19)-(3,20)
*)
