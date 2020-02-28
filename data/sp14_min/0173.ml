
let sqsum xs =
  let f a x = a +. (x ** 2) in let base = 0 in List.fold_left f base xs;;


(* fix

let sqsum xs =
  let f a x = a + (x * x) in let base = 0 in List.fold_left f base xs;;

*)

(* changed spans
(3,15)-(3,28)
a + (x * x)
BopG VarG (BopG EmptyG EmptyG)

*)

(* type error slice
(3,3)-(3,72)
(3,9)-(3,28)
(3,15)-(3,16)
(3,15)-(3,28)
(3,20)-(3,28)
(3,23)-(3,25)
(3,26)-(3,27)
(3,32)-(3,72)
(3,43)-(3,44)
(3,48)-(3,62)
(3,48)-(3,72)
(3,63)-(3,64)
(3,65)-(3,69)
*)
