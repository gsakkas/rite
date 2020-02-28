
let pipe fs =
  let f a x y = a x y in let base x' = x' in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x y = x (a y) in let base x' = x' in List.fold_left f base fs;;

*)

(* changed spans
(3,17)-(3,22)
x (a y)
AppG [AppG [EmptyG]]

*)

(* type error slice
(3,3)-(3,70)
(3,9)-(3,22)
(3,11)-(3,22)
(3,13)-(3,22)
(3,17)-(3,18)
(3,17)-(3,22)
(3,46)-(3,60)
(3,46)-(3,70)
(3,61)-(3,62)
*)
