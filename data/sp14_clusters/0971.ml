
let pipe fs =
  let f a x = match x with | a -> (fun x  -> x) | h::t -> h in
  let base = [] in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x i = x (a i) in let base y = y in List.fold_left f base fs;;

*)

(* changed spans
(3,34)-(3,47)
fun i -> x (a i)
LamG (AppG [EmptyG])

(3,45)-(3,46)
x (a i)
AppG [AppG [EmptyG]]

(3,58)-(3,59)
a i
AppG [VarG]

(4,2)-(4,43)
a
VarG

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
