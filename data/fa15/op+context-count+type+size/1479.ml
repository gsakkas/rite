
let pipe fs =
  let f a x = a (fun x  -> x) in let base f = f in List.fold_left f base fs;;


(* fix

let pipe fs = let f a x x = x in let base f = f in List.fold_left f base fs;;

*)

(* changed spans
(3,3)-(3,76)
(3,15)-(3,16)
(3,15)-(3,29)
(3,34)-(3,76)
*)

(* type error slice
(3,3)-(3,76)
(3,9)-(3,29)
(3,11)-(3,29)
(3,15)-(3,16)
(3,15)-(3,29)
(3,52)-(3,66)
(3,52)-(3,76)
(3,67)-(3,68)
*)
