
let pipe fs =
  let f a x (x,a) = x x in let base x = x in List.fold_left f base fs;;


(* fix

let pipe fs = let f a x = x in let base x = x in List.fold_left f base fs;;

*)

(* changed spans
(3,14)-(3,24)
(3,21)-(3,24)
(3,23)-(3,24)
*)

(* type error slice
(3,21)-(3,22)
(3,21)-(3,24)
(3,23)-(3,24)
*)
