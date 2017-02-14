
let pipe fs =
  let f a x = a (fun a  -> x a) in let base x = x in List.fold_left f base fs;;


(* fix

let pipe fs = let f a x a = x a in let base x = x in List.fold_left f base fs;;

*)

(* changed spans
(3,3)-(3,78)
(3,15)-(3,16)
(3,15)-(3,31)
(3,36)-(3,78)
*)

(* type error slice
(3,3)-(3,78)
(3,9)-(3,31)
(3,11)-(3,31)
(3,15)-(3,16)
(3,15)-(3,31)
(3,54)-(3,68)
(3,54)-(3,78)
(3,69)-(3,70)
*)
