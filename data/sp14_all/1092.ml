
let pipe fs =
  let f a x = a = (fun x  -> fun a  -> x a) in
  let base x = x in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x y = x (a y) in let base x = x in List.fold_left f base fs;;

*)

(* changed spans
(3,15)-(3,44)
fun y -> x (a y)
LamG VarPatG (AppG (fromList [EmptyG]))

*)

(* type error slice
(3,3)-(4,45)
(3,9)-(3,44)
(3,11)-(3,44)
(3,15)-(3,16)
(3,15)-(3,44)
(3,19)-(3,44)
(4,21)-(4,35)
(4,21)-(4,45)
(4,36)-(4,37)
*)
