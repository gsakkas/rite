
let pipe fs =
  let f a x (x,a) = x x in let base x = x in List.fold_left f base fs;;


(* fix

let pipe fs = let f a x = x in let base x = x in List.fold_left f base fs;;

*)

(* changed spans
(3,2)-(3,69)
(3,13)-(3,23)
(3,20)-(3,23)
(3,22)-(3,23)
(3,27)-(3,69)
*)

(* type error slice
(3,20)-(3,21)
(3,20)-(3,23)
(3,22)-(3,23)
*)
