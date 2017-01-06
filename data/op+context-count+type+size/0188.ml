
let sqsum xs = let f a x = a ** x in let base = 0 in List.fold_left f base xs;;



let sqsum xs =
  let f a x = (a * a) + (x * x) in let base = 0 in List.fold_left f base xs;;


(* changed spans
(2,30)-(2,32)
*)

(* type error slice
(2,54)-(2,78)
*)
