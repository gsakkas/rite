
let pipe fs =
  let f a x k = a k x in let base y = y in List.fold_left f base fs;;



let pipe fs =
  let f a x k = x (a k) in let base y = y in List.fold_left f base fs;;


(* changed spans
(3,21)-(3,22)
*)

(* type error slice
(3,44)-(3,68)
*)
