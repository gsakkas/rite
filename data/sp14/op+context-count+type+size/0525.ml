
let pipe fs =
  let f a x k = x (k a) in let base y = y in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x k = x (a k) in let base y = y in List.fold_left f base fs;;

*)

(* changed spans
(3,19)-(3,20)
(3,27)-(3,69)
*)

(* type error slice
(3,2)-(3,69)
(3,8)-(3,23)
(3,10)-(3,23)
(3,12)-(3,23)
(3,18)-(3,23)
(3,19)-(3,20)
(3,21)-(3,22)
(3,45)-(3,59)
(3,45)-(3,69)
(3,60)-(3,61)
*)
