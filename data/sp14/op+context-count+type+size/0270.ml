
let pipe fs =
  let f a x = x (a x) in let base y = y in List.fold_left f base fs;;


(* fix

let pipe fs y = let f a x = x a in let base = y in List.fold_left f base fs;;

*)

(* changed spans
(3,3)-(3,68)
(3,9)-(3,21)
(3,18)-(3,21)
(3,20)-(3,21)
(3,26)-(3,68)
(3,35)-(3,40)
*)

(* type error slice
(3,3)-(3,68)
(3,9)-(3,21)
(3,11)-(3,21)
(3,15)-(3,16)
(3,15)-(3,21)
(3,18)-(3,19)
(3,18)-(3,21)
(3,20)-(3,21)
(3,44)-(3,58)
(3,44)-(3,68)
(3,59)-(3,60)
*)
