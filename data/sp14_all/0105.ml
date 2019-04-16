
let pipe fs =
  let f a x = a (fun a  -> x) in let base x = x in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x = (fun a  -> x) x in let base x = x in List.fold_left f base fs;;

*)

(* changed spans
(3,15)-(3,30)
(fun a -> x) x
AppG (fromList [VarG])

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
