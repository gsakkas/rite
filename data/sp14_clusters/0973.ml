
let pipe fs =
  let f a x = match a with | [] -> x | _ -> x a in
  let base = [] in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x i = x (a i) in let base y = y in List.fold_left f base fs;;

*)

(* changed spans
(3,35)-(3,36)
fun i -> x (a i)
LamG (AppG [EmptyG])

(3,46)-(3,47)
a i
AppG [VarG]

(4,2)-(4,43)
i
VarG

(4,13)-(4,15)
fun y -> y
LamG VarG

(4,19)-(4,43)
y
VarG

*)
