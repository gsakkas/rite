
let pipe fs =
  let f a x c x = a a in let base g x = x in List.fold_left f base fs;;


(* fix

let pipe fs = let f a x = a in let base g x = x in List.fold_left f base fs;;

*)

(* changed spans
(3,3)-(3,70)
(3,13)-(3,22)
(3,15)-(3,22)
(3,19)-(3,22)
(3,21)-(3,22)
(3,26)-(3,70)
*)

(* type error slice
(3,19)-(3,20)
(3,19)-(3,22)
(3,21)-(3,22)
*)
