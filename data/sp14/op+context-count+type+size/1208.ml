
let pipe fs = let f a x a = x x in let base x = x in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x x a = x a in let base x = x in List.fold_left f base fs;;

*)

(* changed spans
(2,15)-(2,78)
(2,25)-(2,32)
(2,31)-(2,32)
(2,36)-(2,78)
(2,45)-(2,50)
*)

(* type error slice
(2,29)-(2,30)
(2,29)-(2,32)
(2,31)-(2,32)
*)
