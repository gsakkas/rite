
let pipe fs =
  let f a x = x a "to be implemented" in
  let base = 0 "to be implemented" in List.fold_left f base fs;;


(* fix

let pipe fs = let f a x = x in let base b = b in List.fold_left f base fs;;

*)

(* changed spans
(3,3)-(4,63)
(3,15)-(3,38)
(3,17)-(3,18)
(3,19)-(3,38)
(4,3)-(4,63)
(4,14)-(4,15)
(4,14)-(4,35)
(4,16)-(4,35)
(4,39)-(4,63)
*)

(* type error slice
(4,14)-(4,15)
(4,14)-(4,35)
*)
