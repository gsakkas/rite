
let pipe fs =
  let f a x x a = x x a in let base f x = x in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x f' = x (a f') in let base x = x in List.fold_left f base fs;;

*)

(* changed spans
(3,13)-(3,24)
(3,15)-(3,24)
(3,19)-(3,20)
(3,19)-(3,24)
(3,21)-(3,22)
(3,23)-(3,24)
(3,28)-(3,72)
(3,37)-(3,44)
(3,39)-(3,44)
*)

(* type error slice
(3,19)-(3,20)
(3,19)-(3,24)
(3,21)-(3,22)
*)
