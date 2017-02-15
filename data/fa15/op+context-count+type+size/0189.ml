
let bigMul l1 l2 =
  let f a x = a @ 0 in
  let base = [] in let args = l2 in List.fold_left f base args;;


(* fix

let bigMul l1 l2 =
  let f a x = a @ [0] in
  let base = [] in let args = l2 in List.fold_left f base args;;

*)

(* changed spans
(3,18)-(3,19)
*)

(* type error slice
(3,14)-(3,19)
(3,16)-(3,17)
(3,18)-(3,19)
*)
