
let a = 20;;

let pipe fs =
  let f a x = x in let base p = a p in List.fold_left f base (List.rev fs);;


(* fix

let pipe fs =
  let f a x = x in let base p = p in List.fold_left f base (List.rev fs);;

*)

(* changed spans
(2,8)-(2,10)
(5,2)-(5,74)
(5,19)-(5,74)
(5,32)-(5,33)
(5,32)-(5,35)
(5,62)-(5,70)
*)

(* type error slice
(2,3)-(2,12)
(2,8)-(2,10)
(5,32)-(5,33)
(5,32)-(5,35)
*)
