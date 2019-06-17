
let sqsum xs =
  let f a x x = x * x in let base a x = a + x in List.fold_left f base xs;;


(* fix

let sqsum xs =
  let f a x a x = a + x in
  let base = 0 in List.fold_left (fun a  -> fun x  -> a + (x * x)) 0 xs;;

*)

(* changed spans
(3,13)-(3,22)
fun a -> fun x -> a + x
LamG VarPatG (LamG EmptyPatG EmptyG)

(3,35)-(3,46)
0
LitG

(3,65)-(3,66)
fun a -> fun x -> a + (x * x)
LamG VarPatG (LamG EmptyPatG EmptyG)

(3,67)-(3,71)
0
LitG

*)

(* type error slice
(3,3)-(3,74)
(3,9)-(3,22)
(3,11)-(3,22)
(3,13)-(3,22)
(3,17)-(3,22)
(3,26)-(3,74)
(3,35)-(3,46)
(3,37)-(3,46)
(3,50)-(3,64)
(3,50)-(3,74)
(3,65)-(3,66)
(3,67)-(3,71)
*)
