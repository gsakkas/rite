
let pipe fs =
  let f a x y z = z y in let base b = b in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x y z = y z in let base b = b in List.fold_left f base fs;;

*)

(* changed spans
(3,25)-(3,67)
z
VarG

*)
