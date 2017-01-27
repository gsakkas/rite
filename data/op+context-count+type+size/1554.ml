
let pipe fs =
  let f a x fn fn2 = a in let base b = b in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x fn = x (fun a  -> a) in
  let base b = b in List.fold_left f base fs;;

*)

(* changed spans
(3,16)-(3,23)
(3,22)-(3,23)
*)

(* type error slice
(3,3)-(3,69)
(3,9)-(3,23)
(3,11)-(3,23)
(3,13)-(3,23)
(3,16)-(3,23)
(3,22)-(3,23)
(3,27)-(3,69)
(3,36)-(3,41)
(3,40)-(3,41)
(3,45)-(3,59)
(3,45)-(3,69)
(3,60)-(3,61)
(3,62)-(3,66)
(3,67)-(3,69)
*)
