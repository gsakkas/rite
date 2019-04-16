
let pipe fs =
  let f a x = match x with | [] -> a | h::t -> t in
  let base x = x in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x i = x (a i) in let base y = y in List.fold_left f base fs;;

*)

(* changed spans
(3,15)-(3,49)
fun i -> x (a i)
LamG VarPatG (AppG (fromList [EmptyG]))

(4,12)-(4,17)
fun y -> y
LamG VarPatG VarG

*)

(* type error slice
(3,3)-(4,45)
(3,9)-(3,49)
(3,15)-(3,49)
(3,36)-(3,37)
(3,48)-(3,49)
(4,3)-(4,45)
(4,12)-(4,17)
(4,21)-(4,35)
(4,21)-(4,45)
(4,36)-(4,37)
(4,38)-(4,42)
*)
