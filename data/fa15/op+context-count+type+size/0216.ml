
let bigMul l1 l2 =
  let f a x = [a] :: 0 in
  let base = [] in let args = l2 in List.fold_left f base args;;


(* fix

let bigMul l1 l2 =
  let f a x = a @ [0] in
  let base = [] in let args = l2 in List.fold_left f base args;;

*)

(* changed spans
(3,15)-(3,18)
(3,15)-(3,23)
(3,16)-(3,17)
(3,22)-(3,23)
*)

(* type error slice
(3,3)-(4,63)
(3,9)-(3,23)
(3,11)-(3,23)
(3,15)-(3,18)
(3,15)-(3,18)
(3,15)-(3,23)
(3,15)-(3,23)
(3,15)-(3,23)
(3,16)-(3,17)
(3,22)-(3,23)
(4,37)-(4,51)
(4,37)-(4,63)
(4,52)-(4,53)
*)
