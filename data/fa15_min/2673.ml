
let pipe fs =
  let f a x y c = a (x c) in let base y = y in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x y = x (a y) in let base y = y in List.fold_left f base fs;;

*)

(* changed spans
(3,15)-(3,26)
x (a y)
AppG [AppG [EmptyG]]

*)

(* type error slice
(3,3)-(3,72)
(3,9)-(3,26)
(3,11)-(3,26)
(3,13)-(3,26)
(3,15)-(3,26)
(3,19)-(3,20)
(3,19)-(3,26)
(3,48)-(3,62)
(3,48)-(3,72)
(3,63)-(3,64)
*)
