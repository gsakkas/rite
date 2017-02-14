
let bigMul l1 l2 =
  let f a x = [a] :: 0 in
  let base = [] in let args = l2 in List.fold_left f base args;;


(* fix

let bigMul l1 l2 =
  let f a x = a @ [0] in
  let base = [] in let args = l2 in List.fold_left f base args;;

*)

(* changed spans
(3,14)-(3,17)
(3,14)-(3,22)
(3,15)-(3,16)
(3,21)-(3,22)
*)

(* type error slice
(3,2)-(4,62)
(3,8)-(3,22)
(3,10)-(3,22)
(3,14)-(3,17)
(3,14)-(3,17)
(3,14)-(3,22)
(3,14)-(3,22)
(3,14)-(3,22)
(3,15)-(3,16)
(3,21)-(3,22)
(4,36)-(4,50)
(4,36)-(4,62)
(4,51)-(4,52)
*)
