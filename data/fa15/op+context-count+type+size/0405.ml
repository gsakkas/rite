
let pipe fs =
  let f a x f' a x = x a in let base = 0 in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x f' a x = x a in let base y = y in List.fold_left f base fs;;

*)

(* changed spans
(3,40)-(3,41)
(3,45)-(3,69)
*)

(* type error slice
(3,3)-(3,69)
(3,9)-(3,25)
(3,11)-(3,25)
(3,13)-(3,25)
(3,29)-(3,69)
(3,40)-(3,41)
(3,45)-(3,59)
(3,45)-(3,69)
(3,60)-(3,61)
(3,62)-(3,66)
*)
