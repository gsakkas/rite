
let pipe fs =
  let f a x y = a (y x) in let base x = x in List.fold_left f base fs;;



let pipe fs = let f a x x = a x in let base y = y in List.fold_left f base fs;;


(* changed spans
(3,13)-(3,14)
(3,19)-(3,21)
(3,23)-(3,24)
(3,37)-(3,38)
(3,41)-(3,42)
*)

(* type error slice
(3,46)-(3,70)
*)
