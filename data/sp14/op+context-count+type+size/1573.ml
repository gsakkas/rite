
let pipe fs =
  let f a x c y z = z (a c) in let base b = b in List.fold_left f base fs;;


(* fix

let pipe fs = let f a x c = x c in let base b = b in List.fold_left f base fs;;

*)

(* changed spans
(3,2)-(3,73)
(3,14)-(3,27)
(3,16)-(3,27)
(3,20)-(3,21)
(3,22)-(3,27)
(3,23)-(3,24)
(3,31)-(3,73)
*)

(* type error slice
(3,2)-(3,73)
(3,8)-(3,27)
(3,10)-(3,27)
(3,12)-(3,27)
(3,14)-(3,27)
(3,16)-(3,27)
(3,20)-(3,21)
(3,20)-(3,27)
(3,22)-(3,27)
(3,23)-(3,24)
(3,49)-(3,63)
(3,49)-(3,73)
(3,64)-(3,65)
*)
