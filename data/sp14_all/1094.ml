
let pipe fs =
  let f a x = a = (fun x  -> fun y  -> x (a y)) in
  let base x = x in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x y = x (a y) in let base x = x in List.fold_left f base fs;;

*)

(* changed spans
(3,15)-(3,48)
fun y -> x (a y)
LamG VarPatG (AppG (fromList [EmptyG]))

*)

(* type error slice
(3,15)-(3,16)
(3,15)-(3,48)
(3,19)-(3,48)
(3,30)-(3,47)
(3,40)-(3,41)
(3,40)-(3,47)
(3,42)-(3,47)
(3,43)-(3,44)
(3,45)-(3,46)
*)
