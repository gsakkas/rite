
let pipe fs =
  let f a x = function | g -> x (g a) in
  let base = function | b -> b in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x = function | g -> x (a g) in
  let base = function | b -> b in List.fold_left f base fs;;

*)

(* changed spans
(3,33)-(3,34)
(4,2)-(4,58)
*)

(* type error slice
(3,2)-(4,58)
(3,8)-(3,37)
(3,10)-(3,37)
(3,14)-(3,37)
(3,14)-(3,37)
(3,14)-(3,37)
(3,32)-(3,37)
(3,33)-(3,34)
(3,35)-(3,36)
(4,34)-(4,48)
(4,34)-(4,58)
(4,49)-(4,50)
*)
