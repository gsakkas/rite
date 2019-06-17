
let pipe fs =
  let f a x = a (fun n  -> n) in let base n = n in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x = (fun n  -> n) x in let base n = n in List.fold_left f base fs;;

*)

(* changed spans
(3,15)-(3,30)
(fun n -> n) x
AppG [VarG]

*)

(* type error slice
(3,3)-(3,76)
(3,9)-(3,30)
(3,11)-(3,30)
(3,15)-(3,16)
(3,15)-(3,30)
(3,52)-(3,66)
(3,52)-(3,76)
(3,67)-(3,68)
*)
