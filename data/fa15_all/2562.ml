
let sqsum xs =
  let f a x a x = a + (x * x) in
  let base = "string" in List.fold_left f base xs;;


(* fix

let sqsum xs =
  let f a x a x = a + x in
  let base = 0 in List.fold_left (fun a  -> fun x  -> a + (x * x)) 0 xs;;

*)

(* changed spans
(4,13)-(4,21)
0
LitG

(4,42)-(4,46)
fun a -> fun x -> a + (x * x)
LamG (LamG EmptyG)

(4,47)-(4,49)
a
VarG

(4,47)-(4,49)
x
VarG

(4,47)-(4,49)
x
VarG

(4,47)-(4,49)
fun x -> a + (x * x)
LamG (BopG EmptyG EmptyG)

(4,47)-(4,49)
a + (x * x)
BopG VarG (BopG EmptyG EmptyG)

(4,47)-(4,49)
x * x
BopG VarG VarG

(4,47)-(4,49)
0
LitG

*)
