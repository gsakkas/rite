
let sqsum xs =
  let f a x a x = a + (x * x) in let base = xs in List.fold_left f base xs;;


(* fix

let sqsum xs =
  let f a x a x = a + x in
  let base = 0 in List.fold_left (fun a  -> fun x  -> a + (x * x)) 0 xs;;

*)

(* changed spans
(3,23)-(3,30)
x
VarG

(3,45)-(3,47)
0
LitG

(3,66)-(3,67)
fun a -> fun x -> a + (x * x)
LamG VarPatG (LamG EmptyPatG EmptyG)

(3,68)-(3,72)
0
LitG

*)

(* type error slice
(3,3)-(3,75)
(3,9)-(3,30)
(3,11)-(3,30)
(3,13)-(3,30)
(3,34)-(3,75)
(3,45)-(3,47)
(3,51)-(3,65)
(3,51)-(3,75)
(3,66)-(3,67)
(3,68)-(3,72)
(3,73)-(3,75)
*)
