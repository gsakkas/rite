
let pipe fs =
  let f a x = x fs in let base p = p in List.fold_left f base (List.rev fs);;


(* fix

let pipe fs =
  let f a x = x in let base p = p in List.fold_left f base (List.rev fs);;

*)

(* changed spans
(3,14)-(3,18)
(3,16)-(3,18)
(3,22)-(3,75)
*)

(* type error slice
(3,2)-(3,75)
(3,8)-(3,18)
(3,10)-(3,18)
(3,14)-(3,15)
(3,14)-(3,18)
(3,16)-(3,18)
(3,40)-(3,54)
(3,40)-(3,75)
(3,55)-(3,56)
(3,62)-(3,75)
(3,63)-(3,71)
(3,72)-(3,74)
*)
