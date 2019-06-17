
let pipe fs = let f a x = a x in let base = [] in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x f x f a = f a x in let base y = y in List.fold_left f base fs;;

*)

(* changed spans
(2,27)-(2,30)
fun f ->
  fun x ->
    fun f -> fun a -> f a x
LamG VarPatG (LamG EmptyPatG EmptyG)

(2,45)-(2,47)
fun y -> y
LamG VarPatG VarG

*)

(* type error slice
(2,15)-(2,75)
(2,21)-(2,30)
(2,23)-(2,30)
(2,27)-(2,28)
(2,27)-(2,30)
(2,51)-(2,65)
(2,51)-(2,75)
(2,66)-(2,67)
*)
