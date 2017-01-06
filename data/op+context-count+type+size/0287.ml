
let pipe fs =
  let f a x = x (a a) in let base y = y in List.fold_left f base fs;;



let pipe fs y = let f a x = x a in let base = y in List.fold_left f base fs;;


(* changed spans
(3,17)-(3,18)
(3,20)-(3,22)
(3,35)-(3,36)
*)

(* type error slice
(3,18)-(3,21)
*)
