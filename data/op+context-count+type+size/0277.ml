
let pipe fs =
  let f a x = (+) (x a) in let base = 0 in List.fold_left f base fs;;



let pipe fs = let f a x a = a in let base x = x in List.fold_left f base fs;;


(* changed spans
(3,15)-(3,21)
(3,23)-(3,24)
(3,39)-(3,40)
*)

(* type error slice
*)
