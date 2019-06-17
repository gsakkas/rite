
let pipe fs =
  let f a x = function | g -> x (g a) in
  let base = function | b -> b in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x = function | g -> x (a g) in
  let base = function | b -> b in List.fold_left f base fs;;

*)

(* changed spans
(3,33)-(3,38)
a g
AppG [VarG]

*)

(* type error slice
(3,3)-(4,59)
(3,9)-(3,38)
(3,11)-(3,38)
(3,15)-(3,38)
(3,33)-(3,38)
(3,34)-(3,35)
(3,36)-(3,37)
(4,35)-(4,49)
(4,35)-(4,59)
(4,50)-(4,51)
*)
