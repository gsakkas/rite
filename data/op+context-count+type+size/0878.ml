
let pipe fs =
  let f a x a = (x a) + x in let base x = x in List.fold_left f base fs;;


(* fix

let pipe fs y = let f a x = x a in let base = y in List.fold_left f base fs;;

*)

(* changed spans
(3,3)-(3,72)
(3,13)-(3,26)
(3,18)-(3,26)
(3,25)-(3,26)
(3,39)-(3,44)
(3,43)-(3,44)
*)

(* type error slice
(3,18)-(3,19)
(3,18)-(3,21)
(3,18)-(3,26)
(3,20)-(3,21)
(3,25)-(3,26)
*)
