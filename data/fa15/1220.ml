
let stringOfList f l = let base = f in List.fold_left f base l;;


(* fix

let stringOfList f l =
  let fx a b = a ^ b in let base = "" in List.fold_left fx base l;;

*)

(* changed spans
(2,23)-(2,62)
(2,34)-(2,35)
(2,54)-(2,55)
*)

(* type error slice
(2,23)-(2,62)
(2,34)-(2,35)
(2,39)-(2,53)
(2,39)-(2,62)
(2,54)-(2,55)
(2,56)-(2,60)
*)

(* all spans
(2,17)-(2,62)
(2,19)-(2,62)
(2,23)-(2,62)
(2,34)-(2,35)
(2,39)-(2,62)
(2,39)-(2,53)
(2,54)-(2,55)
(2,56)-(2,60)
(2,61)-(2,62)
*)
