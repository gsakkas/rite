
let pipe fs = let f a x = fs a x in let base = [] in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x = (fun n  -> n) a in let base n = n in List.fold_left f base fs;;

*)

(* changed spans
(2,15)-(2,78)
(2,27)-(2,29)
(2,27)-(2,33)
(2,30)-(2,31)
(2,32)-(2,33)
(2,37)-(2,78)
(2,48)-(2,50)
(2,54)-(2,78)
*)

(* type error slice
(2,27)-(2,29)
(2,27)-(2,33)
(2,54)-(2,68)
(2,54)-(2,78)
(2,76)-(2,78)
*)
