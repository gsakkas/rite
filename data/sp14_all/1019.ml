
let pipe fs =
  let f a x = x fs in let base p = p in List.fold_left f base (List.rev fs);;


(* fix

let pipe fs =
  let f a x = x in let base p = p in List.fold_left f base (List.rev fs);;

*)

(* changed spans
(3,15)-(3,19)
x
VarG

*)

(* type error slice
(3,3)-(3,76)
(3,9)-(3,19)
(3,11)-(3,19)
(3,15)-(3,16)
(3,15)-(3,19)
(3,17)-(3,19)
(3,41)-(3,55)
(3,41)-(3,76)
(3,56)-(3,57)
(3,63)-(3,76)
(3,64)-(3,72)
(3,73)-(3,75)
*)
