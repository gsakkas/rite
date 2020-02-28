
let pipe fs =
  let f a x = function | g -> g x a in
  let base = function | x -> x in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x = function | g -> g in
  let base = function | x -> x in List.fold_left f base fs;;

*)

(* changed spans
(3,31)-(3,36)
g
VarG

*)

(* type error slice
(3,3)-(4,59)
(3,9)-(3,36)
(3,11)-(3,36)
(3,15)-(3,36)
(3,31)-(3,32)
(3,31)-(3,36)
(3,35)-(3,36)
(4,35)-(4,49)
(4,35)-(4,59)
(4,50)-(4,51)
*)
