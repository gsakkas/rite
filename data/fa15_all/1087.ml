
let sqsum xs =
  let f a x = match x with | [] -> 0 | h::t -> 1 in
  let base = List.hd xs in List.fold_left f base xs;;


(* fix

let sqsum xs =
  let f a x = (a * a) + (x * x) in
  let base = List.hd xs in List.fold_left f base xs;;

*)

(* changed spans
(3,14)-(3,48)
(a * a) + (x * x)
BopG (BopG EmptyG EmptyG) (BopG EmptyG EmptyG)

(3,20)-(3,21)
a
VarG

(3,20)-(3,21)
a
VarG

(3,20)-(3,21)
a * a
BopG VarG VarG

(3,20)-(3,21)
x * x
BopG VarG VarG

(3,47)-(3,48)
x
VarG

*)
