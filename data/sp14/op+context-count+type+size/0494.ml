
let pipe fs =
  let f a x g = (a x) g in let base g = g in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x g = x (a g) in let base g = g in List.fold_left f base fs;;

*)

(* changed spans
(3,18)-(3,21)
(3,20)-(3,21)
*)

(* type error slice
(3,3)-(3,70)
(3,9)-(3,24)
(3,11)-(3,24)
(3,13)-(3,24)
(3,18)-(3,19)
(3,18)-(3,21)
(3,18)-(3,24)
(3,46)-(3,60)
(3,46)-(3,70)
(3,61)-(3,62)
*)
