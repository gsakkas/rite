
let pipe fs =
  let f a x combine c = a c in let base x = x in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x c = x (a c) in let base x = x in List.fold_left f base fs;;

*)

(* changed spans
(3,24)-(3,25)
x
VarG

(3,24)-(3,25)
a c
AppG (fromList [VarG])

*)
