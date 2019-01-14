
let sqsum xs = let f a x = a * a in let base = f in List.fold_left f base xs;;


(* fix

let sqsum xs =
  let f a x = a + x in let base = List.hd xs in List.fold_left f base xs;;

*)

(* changed spans
(2,27)-(2,28)
a + x
BopG VarG VarG

(2,36)-(2,76)
x
VarG

(2,47)-(2,48)
List.hd xs
AppG (fromList [VarG])

(2,52)-(2,76)
List.hd
VarG

(2,52)-(2,76)
xs
VarG

*)
