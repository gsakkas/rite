
let sqsum xs =
  let f a x = x ** 2.0 in let base = 0 in List.fold_left f base xs;;



let sqsum xs = let f a x = x * x in let base = 0 in List.fold_left f base xs;;


(* changed spans
(3,17)-(3,23)
*)

(* type error slice
(3,43)-(3,67)
*)
