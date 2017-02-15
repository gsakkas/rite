
let pipe fs = let f a x x = x x in let base x = x in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x x a = x a in let base x = x in List.fold_left f base fs;;

*)

(* changed spans
(2,14)-(2,77)
(2,28)-(2,31)
(2,30)-(2,31)
(2,35)-(2,77)
(2,44)-(2,49)
*)

(* type error slice
(2,28)-(2,29)
(2,28)-(2,31)
(2,30)-(2,31)
*)
