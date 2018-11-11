
let pipe fs =
  let f a x fn fn2 = a in let base b = b in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x fn = x (fun a  -> a) in
  let base b = b in List.fold_left f base fs;;

*)

(* changed spans
(3,15)-(3,22)
x (fun a -> a)
AppG [LamG EmptyG]

(3,21)-(3,22)
x
VarG

(3,21)-(3,22)
fun a -> a
LamG VarG

*)
