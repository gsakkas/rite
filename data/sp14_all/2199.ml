
let pipe fs = let f a x j x = a in let base x = x in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x j = x (a j) in let base x = x in List.fold_left f base fs;;

*)

(* changed spans
(2,27)-(2,32)
x (a j)
AppG [AppG [EmptyG]]

*)

(* type error slice
(2,15)-(2,78)
(2,21)-(2,32)
(2,23)-(2,32)
(2,25)-(2,32)
(2,27)-(2,32)
(2,31)-(2,32)
(2,54)-(2,68)
(2,54)-(2,78)
(2,69)-(2,70)
*)
