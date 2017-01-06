
let pipe fs =
  let f a x k = a x k in let base y = y in List.fold_left f base fs;;



let pipe fs =
  let f a x k = x (a k) in let base y = y in List.fold_left f base fs;;


(* changed spans
(3,17)-(3,18)
*)

(* type error slice
(3,44)-(3,68)
*)
