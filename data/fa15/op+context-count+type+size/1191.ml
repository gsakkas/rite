
let pipe fs =
  let f a x = (fun n  -> n) a x in let base n = n in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x = (fun n  -> n) a in let base n = n in List.fold_left f base fs;;

*)

(* changed spans
(3,14)-(3,31)
(3,30)-(3,31)
(3,35)-(3,77)
*)

(* type error slice
(3,2)-(3,77)
(3,8)-(3,31)
(3,10)-(3,31)
(3,14)-(3,27)
(3,14)-(3,31)
(3,25)-(3,26)
(3,28)-(3,29)
(3,53)-(3,67)
(3,53)-(3,77)
(3,68)-(3,69)
*)
