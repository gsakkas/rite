
let pipe fs =
  let f a x c = x (c a) in let base b = b in List.fold_left f base fs;;


(* fix

let pipe fs = let f a x c = x c in let base b = b in List.fold_left f base fs;;

*)

(* changed spans
(3,3)-(3,70)
(3,20)-(3,23)
(3,22)-(3,23)
(3,28)-(3,70)
*)

(* type error slice
(3,3)-(3,70)
(3,9)-(3,23)
(3,11)-(3,23)
(3,13)-(3,23)
(3,20)-(3,21)
(3,20)-(3,23)
(3,22)-(3,23)
(3,46)-(3,60)
(3,46)-(3,70)
(3,61)-(3,62)
*)
