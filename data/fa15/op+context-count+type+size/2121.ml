
let pipe fs =
  let f a x y c = (x a) = x in let base g x = x in List.fold_left f base fs;;


(* fix

let pipe fs = let f a x = a in let base g x = x in List.fold_left f base fs;;

*)

(* changed spans
(3,2)-(3,75)
(3,12)-(3,27)
(3,14)-(3,27)
(3,18)-(3,23)
(3,18)-(3,27)
(3,19)-(3,20)
(3,26)-(3,27)
(3,31)-(3,75)
*)

(* type error slice
(3,18)-(3,23)
(3,18)-(3,27)
(3,18)-(3,27)
(3,19)-(3,20)
(3,26)-(3,27)
*)
