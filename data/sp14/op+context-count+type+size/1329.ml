
let pipe fs =
  let f a x = function | g -> g (x a) in
  let base = function | x -> x in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x = function | g -> g in
  let base = function | x -> x in List.fold_left f base fs;;

*)

(* changed spans
(3,30)-(3,37)
(3,32)-(3,37)
(3,33)-(3,34)
(3,35)-(3,36)
*)

(* type error slice
(3,2)-(4,58)
(3,8)-(3,37)
(3,10)-(3,37)
(3,14)-(3,37)
(3,14)-(3,37)
(3,14)-(3,37)
(3,14)-(3,37)
(3,30)-(3,31)
(3,30)-(3,37)
(4,2)-(4,58)
(4,13)-(4,30)
(4,13)-(4,30)
(4,13)-(4,30)
(4,13)-(4,30)
(4,29)-(4,30)
(4,34)-(4,48)
(4,34)-(4,58)
(4,49)-(4,50)
(4,51)-(4,55)
*)
