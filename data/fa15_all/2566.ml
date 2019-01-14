
let sqsum xs =
  let f a x a x = a + x in let base = 0 in List.fold_left f base xs;;


(* fix

let sqsum xs =
  let f a x a x = a + x in
  let base = 0 in List.fold_left (fun a  -> fun x  -> a + (x * x)) 0 xs;;

*)

(* changed spans
(3,60)-(3,64)
fun a -> fun x -> a + (x * x)
LamG (LamG EmptyG)

(3,65)-(3,67)
a
VarG

(3,65)-(3,67)
x
VarG

(3,65)-(3,67)
x
VarG

(3,65)-(3,67)
fun x -> a + (x * x)
LamG (BopG EmptyG EmptyG)

(3,65)-(3,67)
a + (x * x)
BopG VarG (BopG EmptyG EmptyG)

(3,65)-(3,67)
x * x
BopG VarG VarG

(3,65)-(3,67)
0
LitG

*)
