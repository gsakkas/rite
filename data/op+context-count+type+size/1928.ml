
let pipe fs p =
  let f a x = x (a p) in let base = p in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x p = x (a p) in let base x = x in List.fold_left f base fs;;

*)

(* changed spans
(2,13)-(3,66)
(3,15)-(3,21)
(3,37)-(3,38)
(3,42)-(3,66)
*)

(* type error slice
(3,3)-(3,66)
(3,9)-(3,21)
(3,11)-(3,21)
(3,15)-(3,16)
(3,15)-(3,21)
(3,18)-(3,19)
(3,18)-(3,21)
(3,20)-(3,21)
(3,26)-(3,66)
(3,37)-(3,38)
(3,42)-(3,56)
(3,42)-(3,66)
(3,57)-(3,58)
(3,59)-(3,63)
(3,64)-(3,66)
*)
