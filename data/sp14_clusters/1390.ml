
let pipe fs = let f a x = a x in let base = [] in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x f x f a = f a x in let base y = y in List.fold_left f base fs;;

*)

(* changed spans
(2,26)-(2,27)
f
VarG

(2,26)-(2,27)
fun x ->
  fun f -> fun a -> f a x
LamG (LamG EmptyG)

(2,26)-(2,27)
fun f -> fun a -> f a x
LamG (LamG EmptyG)

(2,26)-(2,27)
fun a -> f a x
LamG (AppG [EmptyG,EmptyG])

(2,26)-(2,27)
f a x
AppG [VarG,VarG]

(2,26)-(2,29)
fun f ->
  fun x ->
    fun f -> fun a -> f a x
LamG (LamG EmptyG)

(2,44)-(2,46)
fun y -> y
LamG VarG

(2,50)-(2,74)
y
VarG

*)
