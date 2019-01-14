
let pipe fs =
  let f a x = match x with | [] -> [] | h::t -> h in
  let base = 0 in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x y = x (a y) in let base i = i in List.fold_left f base fs;;

*)

(* changed spans
(3,14)-(3,49)
fun y -> x (a y)
LamG (AppG (fromList [EmptyG]))

(3,20)-(3,21)
x (a y)
AppG (fromList [AppG (fromList [EmptyG])])

(3,48)-(3,49)
a y
AppG (fromList [VarG])

(4,2)-(4,42)
a
VarG

(4,2)-(4,42)
y
VarG

(4,13)-(4,14)
fun i -> i
LamG VarG

(4,18)-(4,42)
i
VarG

*)
