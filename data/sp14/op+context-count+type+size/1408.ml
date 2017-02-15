
let pipe fs =
  let f a x fn fn2 = a in let base b = b in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x fn = x (fun a  -> a) in
  let base b = b in List.fold_left f base fs;;

*)

(* changed spans
(3,15)-(3,22)
(3,21)-(3,22)
(3,26)-(3,68)
*)

(* type error slice
(3,2)-(3,68)
(3,8)-(3,22)
(3,10)-(3,22)
(3,12)-(3,22)
(3,15)-(3,22)
(3,21)-(3,22)
(3,44)-(3,58)
(3,44)-(3,68)
(3,59)-(3,60)
*)
