
let sqsum xs =
  let f a x x = x * x in let base a x = a + x in List.fold_left f base xs;;


(* fix

let sqsum xs =
  let f a x a x = a + x in
  let base = 0 in List.fold_left (fun a  -> fun x  -> a + (x * x)) 0 xs;;

*)

(* changed spans
(3,12)-(3,21)
fun a -> fun x -> a + x
LamG (LamG EmptyG)

(3,16)-(3,17)
a + x
BopG VarG VarG

(3,20)-(3,21)
a
VarG

(3,34)-(3,45)
List.fold_left
VarG

(3,34)-(3,45)
List.fold_left (fun a ->
                  fun x -> a + (x * x)) 0 xs
AppG (fromList [VarG,LamG EmptyG,LitG])

(3,34)-(3,45)
0
LitG

(3,44)-(3,45)
x * x
BopG VarG VarG

(3,66)-(3,70)
x
VarG

(3,71)-(3,73)
0
LitG

*)
