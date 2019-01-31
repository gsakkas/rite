
let sqsum xs =
  let f a x = match x with | [] -> 0 | x::xs' -> a * a in
  let base = List.hd xs in List.fold_left f base xs;;


(* fix

let sqsum xs =
  let f a x = (a * a) + (x * x) in
  let base = List.hd xs in List.fold_left f base xs;;

*)

(* changed spans
(3,35)-(3,36)
(a * a) + (x * x)
BopG (BopG EmptyG EmptyG) (BopG EmptyG EmptyG)

(4,2)-(4,51)
x
VarG

(4,2)-(4,51)
x
VarG

(4,2)-(4,51)
x * x
BopG VarG VarG

*)
