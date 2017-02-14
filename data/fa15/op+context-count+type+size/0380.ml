
let pipe fs =
  let f a x x a = x x a in let base f x = x in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x f' = x (a f') in let base x = x in List.fold_left f base fs;;

*)

(* changed spans
(3,12)-(3,23)
(3,14)-(3,23)
(3,18)-(3,19)
(3,18)-(3,23)
(3,20)-(3,21)
(3,22)-(3,23)
(3,27)-(3,71)
(3,36)-(3,43)
(3,38)-(3,43)
*)

(* type error slice
(3,18)-(3,19)
(3,18)-(3,23)
(3,20)-(3,21)
*)
