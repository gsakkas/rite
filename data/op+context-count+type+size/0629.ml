
let pipe fs =
  let f a x y = y a x in let base x = x in List.fold_left f base fs;;



let pipe fs = let f a x x = a x in let base y = y in List.fold_left f base fs;;


(* changed spans
(3,13)-(3,14)
(3,17)-(3,18)
(3,35)-(3,36)
(3,39)-(3,40)
*)

(* type error slice
(3,44)-(3,68)
*)
