
let pipe fs =
  let f a x y c = (x a) = x in let base g x = x in List.fold_left f base fs;;


(* fix

let pipe fs = let f a x = a in let base g x = x in List.fold_left f base fs;;

*)

(* changed spans
(3,3)-(3,76)
(3,13)-(3,28)
(3,15)-(3,28)
(3,20)-(3,21)
(3,20)-(3,23)
(3,20)-(3,28)
(3,27)-(3,28)
(3,32)-(3,76)
*)

(* type error slice
(3,20)-(3,21)
(3,20)-(3,23)
(3,20)-(3,28)
(3,20)-(3,28)
(3,27)-(3,28)
*)
