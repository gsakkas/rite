
let pipe fs =
  let f a x = match a with | _ -> x a | [] -> x in
  let base = [] in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x i = x (a i) in let base y = y in List.fold_left f base fs;;

*)

(* changed spans
(3,20)-(3,21)
fun i -> x (a i)
LamG (AppG (fromList [EmptyG]))

(3,36)-(3,37)
a i
AppG (fromList [VarG])

(3,46)-(3,47)
i
VarG

(4,13)-(4,15)
fun y -> y
LamG VarG

(4,19)-(4,43)
y
VarG

*)
