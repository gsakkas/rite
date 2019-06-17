
let pipe fs =
  let f a x f' = f' (x a) in let base x = x in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x f' = x (a f') in let base x = x in List.fold_left f base fs;;

*)

(* changed spans
(3,18)-(3,26)
x (a f')
AppG [AppG [EmptyG]]

*)

(* type error slice
(3,3)-(3,72)
(3,9)-(3,26)
(3,11)-(3,26)
(3,13)-(3,26)
(3,18)-(3,20)
(3,18)-(3,26)
(3,30)-(3,72)
(3,39)-(3,44)
(3,43)-(3,44)
(3,48)-(3,62)
(3,48)-(3,72)
(3,63)-(3,64)
(3,65)-(3,69)
*)
