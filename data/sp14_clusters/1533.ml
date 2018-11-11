
let sqsum xs =
  let f a x = a + (x * x) in let base = f 4 xs in List.fold_left f base xs;;


(* fix

let sqsum xs =
  let f a x = a * a in let base = f (f 0 xs) xs in List.fold_left f base xs;;

*)

(* changed spans
(3,23)-(3,24)
a
VarG

(3,29)-(3,74)
a
VarG

(3,42)-(3,43)
f 0 xs
AppG [LitG,VarG]

(3,44)-(3,46)
f
VarG

(3,44)-(3,46)
0
LitG

(3,50)-(3,74)
xs
VarG

*)
