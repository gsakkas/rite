
let pipe fs =
  let f a x k = a x k in let base y = y in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x k = x (a k) in let base y = y in List.fold_left f base fs;;

*)

(* changed spans
(3,17)-(3,22)
x (a k)
AppG [AppG [EmptyG]]

*)

(* type error slice
(3,3)-(3,68)
(3,9)-(3,22)
(3,11)-(3,22)
(3,13)-(3,22)
(3,17)-(3,18)
(3,17)-(3,22)
(3,44)-(3,58)
(3,44)-(3,68)
(3,59)-(3,60)
*)
