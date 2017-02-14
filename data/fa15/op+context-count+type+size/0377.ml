
let pipe fs = let f a x = x a in let base = f = 0 in List.fold_left f base fs;;


(* fix

let pipe fs = let f a x = a in let base f = 0 in List.fold_left f base fs;;

*)

(* changed spans
(2,27)-(2,28)
(2,27)-(2,30)
(2,34)-(2,78)
(2,45)-(2,46)
(2,45)-(2,50)
(2,49)-(2,50)
*)

(* type error slice
(2,15)-(2,78)
(2,21)-(2,30)
(2,45)-(2,46)
(2,45)-(2,50)
(2,45)-(2,50)
(2,49)-(2,50)
*)
