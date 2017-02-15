
let pipe fs =
  let f a x a a = a a in let base x = x in List.fold_left f base fs;;


(* fix

let pipe fs = let f a x = a in let base x = x in List.fold_left f base fs;;

*)

(* changed spans
(3,2)-(3,67)
(3,12)-(3,21)
(3,14)-(3,21)
(3,18)-(3,21)
(3,20)-(3,21)
(3,25)-(3,67)
*)

(* type error slice
(3,18)-(3,19)
(3,18)-(3,21)
(3,20)-(3,21)
*)
