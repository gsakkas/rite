
let sqsum xs =
  let f a x = x * x in let base = f 2 xs in List.fold_left f base xs;;


(* fix

let sqsum xs = let f a x = a * a in let base = 0 in List.fold_left f base xs;;

*)

(* changed spans
(3,18)-(3,19)
a
VarG

(3,23)-(3,68)
a
VarG

(3,38)-(3,40)
0
LitG

*)
