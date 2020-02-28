
let pipe fs =
  let f a x n fs = a in let base n = n in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x = (fun a  -> x) x in let base n = n in List.fold_left f base fs;;

*)

(* changed spans
(3,13)-(3,21)
(fun a -> x) x
AppG [VarG]

*)

(* type error slice
(3,3)-(3,67)
(3,9)-(3,21)
(3,11)-(3,21)
(3,13)-(3,21)
(3,15)-(3,21)
(3,20)-(3,21)
(3,43)-(3,57)
(3,43)-(3,67)
(3,58)-(3,59)
*)
