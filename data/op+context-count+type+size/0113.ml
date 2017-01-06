
let pipe fs =
  let f a x a x = x a in let base x = x in List.fold_left f base fs;;



let pipe fs =
  let f a x b = x (a b) in let base x = x in List.fold_left f base fs;;


(* changed spans
(3,13)-(3,16)
*)

(* type error slice
(3,44)-(3,68)
*)
