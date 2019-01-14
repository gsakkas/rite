
let sqsum xs =
  let f a x = match x with | [] -> 0 | _ -> 1 in
  let base = List.hd xs in List.fold_left f base xs;;


(* fix

let sqsum xs =
  let f a x = (a * a) + (x * x) in
  let base = List.hd xs in List.fold_left f base xs;;

*)

(* changed spans
(3,14)-(3,45)
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

(3,44)-(3,45)
x
VarG

*)
