
let pipe fs =
  let f a x t = t (x a) in let base z = z in List.fold_left f base fs;;


(* fix

let pipe fs = let f a x q = x q in let base z = z in List.fold_left f base fs;;

*)

(* changed spans
(3,2)-(3,69)
(3,12)-(3,23)
(3,16)-(3,17)
(3,16)-(3,23)
(3,21)-(3,22)
(3,27)-(3,69)
(3,36)-(3,41)
*)

(* type error slice
(3,2)-(3,69)
(3,8)-(3,23)
(3,10)-(3,23)
(3,12)-(3,23)
(3,16)-(3,17)
(3,16)-(3,23)
(3,27)-(3,69)
(3,36)-(3,41)
(3,40)-(3,41)
(3,45)-(3,59)
(3,45)-(3,69)
(3,60)-(3,61)
(3,62)-(3,66)
*)
