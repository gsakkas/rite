
let pipe fs =
  let f a x g = (a x) g in let base g = g in List.fold_left f base fs;;



let pipe fs =
  let f a x g = x (a g) in let base g = g in List.fold_left f base fs;;


(* changed spans
(3,20)-(3,22)
*)

(* type error slice
(3,46)-(3,70)
*)
