
let pipe fs =
  let f a x f x = f a in let base y = y in List.fold_left f base fs;;



let pipe fs =
  let f a x f x f a = f a x in let base y = y in List.fold_left f base fs;;


(* changed spans
*)

(* type error slice
(3,44)-(3,68)
*)
