
let pipe fs =
  let f a x = let a = x in a a in let base x = x in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x x a = x a in let base x = x in List.fold_left f base fs;;

*)

(* changed spans
(3,14)-(3,30)
(3,22)-(3,23)
(3,27)-(3,28)
(3,27)-(3,30)
(3,34)-(3,76)
*)

(* type error slice
(3,27)-(3,28)
(3,27)-(3,30)
(3,29)-(3,30)
*)
