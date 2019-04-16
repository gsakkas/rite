
let pipe fs =
  let f a x = a = (fun y  -> x (a y)) in
  let base x = x in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x y = x (a y) in let base x = x in List.fold_left f base fs;;

*)

(* changed spans
(3,15)-(3,38)
fun y -> x (a y)
LamG VarPatG (AppG (fromList [EmptyG]))

*)

(* type error slice
(3,3)-(4,45)
(3,9)-(3,38)
(3,11)-(3,38)
(3,15)-(3,38)
(3,32)-(3,37)
(3,33)-(3,34)
(4,21)-(4,35)
(4,21)-(4,45)
(4,36)-(4,37)
*)
