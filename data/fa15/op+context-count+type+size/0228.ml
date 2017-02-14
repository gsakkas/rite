
let pipe fs =
  let f a x a = x x a in let base x = x in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x a = x (x a) in let base x = x in List.fold_left f base fs;;

*)

(* changed spans
(3,17)-(3,22)
(3,19)-(3,20)
(3,26)-(3,68)
*)

(* type error slice
(3,17)-(3,18)
(3,17)-(3,22)
(3,19)-(3,20)
*)
