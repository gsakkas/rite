
let pipe fs =
  let f a x = let y z xn = xn a in y in
  let base b = b in List.fold_left f base fs;;


(* fix

let pipe fs = let f a x c = x c in let base b = b in List.fold_left f base fs;;

*)

(* changed spans
(3,15)-(3,37)
fun c -> x c
LamG VarPatG (AppG (fromList [EmptyG]))

*)

(* type error slice
(3,3)-(4,45)
(3,9)-(3,37)
(3,11)-(3,37)
(3,15)-(3,37)
(3,21)-(3,32)
(3,23)-(3,32)
(3,28)-(3,30)
(3,28)-(3,32)
(3,31)-(3,32)
(3,36)-(3,37)
(4,21)-(4,35)
(4,21)-(4,45)
(4,36)-(4,37)
*)
