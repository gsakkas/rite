
let pipe fs =
  let f a x = List.map x a in let base x = x in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x x a = x a in let base x = x in List.fold_left f base fs;;

*)

(* changed spans
(3,14)-(3,22)
(3,14)-(3,26)
(3,23)-(3,24)
(3,30)-(3,72)
*)

(* type error slice
(3,2)-(3,72)
(3,8)-(3,26)
(3,14)-(3,22)
(3,14)-(3,26)
(3,25)-(3,26)
(3,30)-(3,72)
(3,39)-(3,44)
(3,48)-(3,62)
(3,48)-(3,72)
(3,63)-(3,64)
(3,65)-(3,69)
*)
