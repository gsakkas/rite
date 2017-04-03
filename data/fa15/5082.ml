
let pipe fs =
  let f a x = x a "to be implemented" in
  let base = 0 "to be implemented" in List.fold_left f base fs;;


(* fix

let pipe fs = let f a x = x in let base b = b in List.fold_left f base fs;;

*)

(* changed spans
(3,14)-(3,37)
(3,16)-(3,17)
(3,18)-(3,37)
(4,13)-(4,14)
(4,13)-(4,34)
(4,15)-(4,34)
(4,38)-(4,62)
*)

(* type error slice
(4,13)-(4,14)
(4,13)-(4,34)
*)

(* all spans
(2,9)-(4,62)
(3,2)-(4,62)
(3,8)-(3,37)
(3,10)-(3,37)
(3,14)-(3,37)
(3,14)-(3,15)
(3,16)-(3,17)
(3,18)-(3,37)
(4,2)-(4,62)
(4,13)-(4,34)
(4,13)-(4,14)
(4,15)-(4,34)
(4,38)-(4,62)
(4,38)-(4,52)
(4,53)-(4,54)
(4,55)-(4,59)
(4,60)-(4,62)
*)
