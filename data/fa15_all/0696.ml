
let pipe fs =
  let f a x (x,a) = a in let base x = x in List.fold_left f base fs;;


(* fix

let pipe fs = let f a x = x in let base x = x in List.fold_left f base fs;;

*)

(* changed spans
(3,20)-(3,21)
x
VarG

*)
