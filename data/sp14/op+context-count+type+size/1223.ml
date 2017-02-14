
let pipe fs =
  let f a x a a = a a in let base x = x in List.fold_left f base fs;;


(* fix

let pipe fs = let f a x = a in let base x = x in List.fold_left f base fs;;

*)

(* changed spans
(3,3)-(3,68)
(3,13)-(3,22)
(3,15)-(3,22)
(3,19)-(3,22)
(3,21)-(3,22)
(3,26)-(3,68)
*)

(* type error slice
(3,19)-(3,20)
(3,19)-(3,22)
(3,21)-(3,22)
*)
