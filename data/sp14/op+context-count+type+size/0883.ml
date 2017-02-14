
let pipe fs =
  let f a x = (a x) + x in let base x = x in List.fold_left f base fs;;


(* fix

let pipe fs = let f a x y = y in let base x = x in List.fold_left f base fs;;

*)

(* changed spans
(3,3)-(3,70)
(3,16)-(3,17)
(3,16)-(3,19)
(3,16)-(3,24)
(3,18)-(3,19)
(3,23)-(3,24)
(3,28)-(3,70)
(3,37)-(3,42)
*)

(* type error slice
(3,3)-(3,70)
(3,9)-(3,24)
(3,11)-(3,24)
(3,16)-(3,17)
(3,16)-(3,19)
(3,16)-(3,24)
(3,46)-(3,60)
(3,46)-(3,70)
(3,61)-(3,62)
*)
