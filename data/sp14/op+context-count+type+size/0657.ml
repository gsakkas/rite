
let sqsum xs = let f a x = x ** 2 in let base = 0 in List.fold_left f base xs;;


(* fix

let sqsum xs = let f a x = x * x in let base = 0 in List.fold_left f base xs;;

*)

(* changed spans
(2,28)-(2,34)
(2,30)-(2,32)
(2,33)-(2,34)
(2,38)-(2,78)
(2,49)-(2,50)
*)

(* type error slice
(2,28)-(2,34)
(2,30)-(2,32)
(2,33)-(2,34)
*)
