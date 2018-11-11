
let pipe fs =
  let f a x b = (b x) a in let base x = x in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x b = x (a b) in let base x = x in List.fold_left f base fs;;

*)

(* changed spans
(3,22)-(3,23)
a b
AppG [VarG]

(3,27)-(3,69)
b
VarG

*)
