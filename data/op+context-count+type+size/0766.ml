
let pipe fs =
  let f a x = function | _ -> x a in let base = 0 in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x = function | v -> x (a v) in
  let base = function | y -> y in List.fold_left f base fs;;

*)

(* changed spans
(3,15)-(3,34)
(3,33)-(3,34)
(3,38)-(3,78)
(3,49)-(3,50)
(3,54)-(3,68)
(3,54)-(3,78)
(3,69)-(3,70)
(3,71)-(3,75)
(3,76)-(3,78)
*)

(* type error slice
(3,3)-(3,78)
(3,9)-(3,34)
(3,11)-(3,34)
(3,15)-(3,34)
(3,31)-(3,32)
(3,31)-(3,34)
(3,33)-(3,34)
(3,38)-(3,78)
(3,49)-(3,50)
(3,54)-(3,68)
(3,54)-(3,78)
(3,69)-(3,70)
(3,71)-(3,75)
(3,76)-(3,78)
*)
