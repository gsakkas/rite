
let pipe fs = let f a x = a x in let base a = f a in List.fold_left f base fs;;



let pipe fs =
  let f a x z = a (x z) in let base a = a in List.fold_left f base fs;;


(* changed spans
(2,47)-(2,48)
*)

(* type error slice
(2,54)-(2,78)
*)
