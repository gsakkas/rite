
let sqsum xs =
  let f a x = (+) in let base = 3 ** 2 in List.fold_left f base xs;;


(* fix

let sqsum xs = let f a x = a in let base = f 2 xs in List.fold_left f base xs;;

*)

(* changed spans
(3,15)-(3,18)
a
VarG

(3,33)-(3,39)
f 2 xs
AppG [LitG,VarG]

*)

(* type error slice
(3,33)-(3,34)
(3,33)-(3,39)
(3,35)-(3,37)
*)
