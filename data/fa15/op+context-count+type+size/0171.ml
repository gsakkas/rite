
let pipe fs = let f a x = x in let base y = y in List.fold_right f base fs;;


(* fix

let pipe fs = let f a x = x in let base y = y in List.fold_left f base fs;;

*)

(* changed spans
(2,49)-(2,64)
*)

(* type error slice
(2,31)-(2,74)
(2,40)-(2,45)
(2,49)-(2,64)
(2,49)-(2,74)
(2,67)-(2,71)
*)
