
let pipe fs =
  let f a x _ x = x a in let base y = y in List.fold_left f base fs;;



let pipe fs y = let f a x = x a in let base = y in List.fold_left f base fs;;


(* changed spans
(3,13)-(3,16)
(3,35)-(3,36)
*)

(* type error slice
(3,44)-(3,68)
*)
