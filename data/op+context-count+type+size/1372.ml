
let a = 20;;

let pipe fs =
  let f a x = x in let base p = a p in List.fold_left f base (List.rev fs);;


(* fix

let pipe fs =
  let f a x = x in let base p = p in List.fold_left f base (List.rev fs);;

*)

(* changed spans
(2,9)-(2,11)
(5,3)-(5,74)
(5,20)-(5,74)
(5,33)-(5,34)
(5,33)-(5,36)
*)

(* type error slice
(2,4)-(2,13)
(2,9)-(2,11)
(5,33)-(5,34)
(5,33)-(5,36)
*)
