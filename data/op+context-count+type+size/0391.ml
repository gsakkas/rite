
let pipe fs =
  let f a x f x f a = f a x in let base y z = z in List.fold_left f base fs;;



let pipe fs =
  let f a x z = x (a z) in let base z = z in List.fold_left f base fs;;


(* changed spans
(3,13)-(3,20)
(3,23)-(3,26)
(3,41)-(3,42)
*)

(* type error slice
(3,52)-(3,76)
*)
