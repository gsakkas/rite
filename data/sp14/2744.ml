
let pipe fs =
  let f a x = function | g -> g (x a) in
  let base = function | x -> x in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x = function | g -> g in
  let base = function | x -> x in List.fold_left f base fs;;

*)

(* changed spans
(3,31)-(3,38)
g
VarG

*)

(* type error slice
(3,3)-(4,59)
(3,9)-(3,38)
(3,11)-(3,38)
(3,15)-(3,38)
(3,31)-(3,32)
(3,31)-(3,38)
(4,3)-(4,59)
(4,14)-(4,31)
(4,30)-(4,31)
(4,35)-(4,49)
(4,35)-(4,59)
(4,50)-(4,51)
(4,52)-(4,56)
*)
