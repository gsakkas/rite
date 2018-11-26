
let sqsum xs =
  let f a x = (+) in let base = 3 ** 2 in List.fold_left f base xs;;


(* fix

let sqsum xs = let f a x = a in let base = f 2 xs in List.fold_left f base xs;;

*)

(* changed spans
(3,14)-(3,17)
a
VarG

(3,32)-(3,33)
f
VarG

(3,42)-(3,66)
xs
VarG

*)
