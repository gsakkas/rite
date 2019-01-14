
let sqsum xs =
  let f a x a x = a + (x * x) in
  let base base = base in List.fold_left f base xs;;


(* fix

let sqsum xs =
  let f a x a x = a + x in
  let base = 0 in List.fold_left (fun a  -> fun x  -> a + (x * x)) 0 xs;;

*)

(* changed spans
(4,18)-(4,22)
0
LitG

(4,43)-(4,47)
fun a -> fun x -> a + (x * x)
LamG (LamG EmptyG)

(4,48)-(4,50)
a
VarG

(4,48)-(4,50)
x
VarG

(4,48)-(4,50)
x
VarG

(4,48)-(4,50)
fun x -> a + (x * x)
LamG (BopG EmptyG EmptyG)

(4,48)-(4,50)
a + (x * x)
BopG VarG (BopG EmptyG EmptyG)

(4,48)-(4,50)
x * x
BopG VarG VarG

(4,48)-(4,50)
0
LitG

*)
