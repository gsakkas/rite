
let pipe fs =
  let f a x x = x a in let base x1 = x1 in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x a = x a in let base x1 = x1 in List.fold_left f base fs;;

*)

(* changed spans
(3,13)-(3,20)
*)

(* type error slice
(3,3)-(3,68)
(3,9)-(3,20)
(3,11)-(3,20)
(3,13)-(3,20)
(3,17)-(3,18)
(3,17)-(3,20)
(3,19)-(3,20)
(3,44)-(3,58)
(3,44)-(3,68)
(3,59)-(3,60)
*)
