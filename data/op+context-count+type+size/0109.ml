
let pipe fs =
  let f a x = List.map x a in let base x = x in List.fold_left f base fs;;



let pipe fs =
  let f a x x a = x a in let base x = x in List.fold_left f base fs;;


(* changed spans
(3,15)-(3,23)
*)

(* type error slice
(3,15)-(3,27)
*)
