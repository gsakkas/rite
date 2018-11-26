
let pipe fs =
  let f a x = match x with | [] -> a | h::t -> t in
  let base x = x in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x i = x (a i) in let base y = y in List.fold_left f base fs;;

*)

(* changed spans
(3,14)-(3,48)
fun i -> x (a i)
LamG (AppG (fromList [EmptyG]))

(3,20)-(3,21)
x (a i)
AppG (fromList [AppG (fromList [EmptyG])])

(3,35)-(3,36)
a i
AppG (fromList [VarG])

(3,47)-(3,48)
i
VarG

(4,15)-(4,16)
fun y -> y
LamG VarG

(4,20)-(4,44)
y
VarG

*)
