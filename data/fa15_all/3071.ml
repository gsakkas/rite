
let pipe fs =
  let f a x a = x x a in let base x = x in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x a = x (x a) in let base x = x in List.fold_left f base fs;;

*)

(* changed spans
(3,17)-(3,22)
x (x a)
AppG (fromList [AppG (fromList [EmptyG])])

*)

(* type error slice
(3,17)-(3,18)
(3,17)-(3,22)
(3,19)-(3,20)
*)
