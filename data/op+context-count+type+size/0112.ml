
let pipe fs = let f a x x = x a in let base x = x in List.fold_left f base fs;;



let pipe fs =
  let f a x b = x (a b) in let base x = x in List.fold_left f base fs;;


(* changed spans
(2,25)-(2,26)
*)

(* type error slice
(2,54)-(2,78)
*)
