
let pipe fs =
  let f a x a x = x a in let base x = x in List.fold_left f base fs;;



let pipe fs =
  let f a x x a = x a in let base x = x in List.fold_left f base fs;;


(* changed spans
(3,13)-(3,14)
*)

(* type error slice
(3,44)-(3,68)
*)
