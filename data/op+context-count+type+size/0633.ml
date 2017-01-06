
let pipe fs =
  let f a x k = x (k a) in let base y = y in List.fold_left f base fs;;



let pipe fs =
  let f a x k = x (a k) in let base y = y in List.fold_left f base fs;;


(* changed spans
(3,20)-(3,21)
*)

(* type error slice
(3,46)-(3,70)
*)
