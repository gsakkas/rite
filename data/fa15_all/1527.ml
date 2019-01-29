
let sqsum xs = let f a x = (+) in let base = 0 in List.fold_left f base xs;;


(* fix

let sqsum xs = let f a x = a in let base = f 2 xs in List.fold_left f base xs;;

*)

(* changed spans
(2,27)-(2,30)
a
VarG

(2,45)-(2,46)
f 2 xs
AppG (fromList [VarG,LitG])

(2,50)-(2,74)
f
VarG

(2,50)-(2,74)
xs
VarG

(2,50)-(2,74)
2
LitG

*)
