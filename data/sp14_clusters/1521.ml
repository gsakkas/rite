
let pipe fs =
  let f a x k = a k x in let base y = y in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x k = x (a k) in let base y = y in List.fold_left f base fs;;

*)

(* changed spans
(3,16)-(3,17)
x
VarG

(3,16)-(3,17)
a k
AppG [VarG]

(3,16)-(3,21)
x (a k)
AppG [AppG [EmptyG]]

*)
