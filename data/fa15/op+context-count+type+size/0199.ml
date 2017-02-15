
let pipe fs =
  let f a x a = x x a in let base x = x in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x a = x (x a) in let base x = x in List.fold_left f base fs;;

*)

(* changed spans
(3,16)-(3,21)
(3,18)-(3,19)
(3,25)-(3,67)
*)

(* type error slice
(3,16)-(3,17)
(3,16)-(3,21)
(3,18)-(3,19)
*)
