
let sqsum xs =
  let f a x a x = a + (x * x) in
  let base base = base in List.fold_left f base xs;;


(* fix

let sqsum xs =
  let f a x a x = a + x in
  let base = 0 in List.fold_left (fun a  -> fun x  -> a + (x * x)) 0 xs;;

*)

(* changed spans
(3,23)-(3,30)
x
VarG

(4,12)-(4,23)
0
LitG

(4,42)-(4,43)
fun a -> fun x -> a + (x * x)
LamG VarPatG (LamG EmptyPatG EmptyG)

(4,44)-(4,48)
0
LitG

*)

(* type error slice
(3,3)-(4,51)
(3,9)-(3,30)
(3,11)-(3,30)
(3,13)-(3,30)
(3,15)-(3,30)
(3,19)-(3,20)
(3,19)-(3,30)
(4,3)-(4,51)
(4,12)-(4,23)
(4,19)-(4,23)
(4,27)-(4,41)
(4,27)-(4,51)
(4,42)-(4,43)
(4,44)-(4,48)
*)
