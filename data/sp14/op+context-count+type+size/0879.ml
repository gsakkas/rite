
let pipe fs =
  let f a x a = (x a) + x in let base x = x in List.fold_left f base fs;;


(* fix

let pipe fs y = let f a x = x a in let base = y in List.fold_left f base fs;;

*)

(* changed spans
(3,2)-(3,71)
(3,8)-(3,25)
(3,12)-(3,25)
(3,16)-(3,25)
(3,24)-(3,25)
(3,29)-(3,71)
(3,38)-(3,43)
(3,42)-(3,43)
(3,47)-(3,71)
*)

(* type error slice
(3,16)-(3,21)
(3,16)-(3,25)
(3,17)-(3,18)
(3,24)-(3,25)
*)
