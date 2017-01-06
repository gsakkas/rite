
let pipe fs =
  let f a x f x = f (x a) in let base z = z in List.fold_left f base fs;;



let pipe fs =
  let f a x z = x (a z) in let base z = z in List.fold_left f base fs;;


(* changed spans
(3,13)-(3,16)
(3,19)-(3,22)
*)

(* type error slice
(3,48)-(3,72)
*)
