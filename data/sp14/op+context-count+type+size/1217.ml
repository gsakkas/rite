
let pipe fs =
  let f a x = let a = x in a a in let base x = x in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x x a = x a in let base x = x in List.fold_left f base fs;;

*)

(* changed spans
(3,15)-(3,31)
(3,23)-(3,24)
(3,28)-(3,29)
(3,28)-(3,31)
(3,35)-(3,77)
*)

(* type error slice
(3,28)-(3,29)
(3,28)-(3,31)
(3,30)-(3,31)
*)
