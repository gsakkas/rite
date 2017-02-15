
let pipe fs =
  let f a x k = a k x in let base y = y in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x k = x (a k) in let base y = y in List.fold_left f base fs;;

*)

(* changed spans
(3,16)-(3,17)
(3,16)-(3,21)
(3,20)-(3,21)
(3,25)-(3,67)
*)

(* type error slice
(3,2)-(3,67)
(3,8)-(3,21)
(3,10)-(3,21)
(3,12)-(3,21)
(3,16)-(3,17)
(3,16)-(3,21)
(3,43)-(3,57)
(3,43)-(3,67)
(3,58)-(3,59)
*)
