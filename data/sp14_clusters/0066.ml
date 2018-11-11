
let pipe fs =
  let f a x fn x a = fn in let base b = b in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x fn = x (fun a  -> a) in
  let base b = b in List.fold_left f base fs;;

*)

(* changed spans
(3,15)-(3,23)
x (fun a -> a)
AppG [LamG EmptyG]

(3,17)-(3,23)
x
VarG

(3,21)-(3,23)
a
VarG

*)
