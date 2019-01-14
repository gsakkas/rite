
let sqsum xs =
  let f a x a x = a + (x * x) in let base = "" in List.fold_left f base xs;;


(* fix

let sqsum xs =
  let f a x a x = a + x in
  let base = 0 in List.fold_left (fun a  -> fun x  -> a + (x * x)) 0 xs;;

*)

(* changed spans
(3,44)-(3,46)
0
LitG

(3,67)-(3,71)
fun a -> fun x -> a + (x * x)
LamG (LamG EmptyG)

(3,72)-(3,74)
a
VarG

(3,72)-(3,74)
x
VarG

(3,72)-(3,74)
x
VarG

(3,72)-(3,74)
fun x -> a + (x * x)
LamG (BopG EmptyG EmptyG)

(3,72)-(3,74)
a + (x * x)
BopG VarG (BopG EmptyG EmptyG)

(3,72)-(3,74)
x * x
BopG VarG VarG

(3,72)-(3,74)
0
LitG

*)
