
let pipe fs =
  let f a x g = (g x) a in let base g = g in List.fold_left f base fs;;



let pipe fs =
  let f a x g = x (a g) in let base g = g in List.fold_left f base fs;;


(* changed spans
(3,20)-(3,21)
(3,23)-(3,24)
*)

(* type error slice
(3,46)-(3,70)
*)
