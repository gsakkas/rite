
let pipe fs =
  let f a x k = x (k a) in let base y = y in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x k = x (a k) in let base y = y in List.fold_left f base fs;;

*)

(* changed spans
(3,19)-(3,24)
a k
AppG (fromList [VarG])

*)

(* type error slice
(3,3)-(3,70)
(3,9)-(3,24)
(3,11)-(3,24)
(3,13)-(3,24)
(3,19)-(3,24)
(3,20)-(3,21)
(3,22)-(3,23)
(3,46)-(3,60)
(3,46)-(3,70)
(3,61)-(3,62)
*)
