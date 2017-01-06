
let pipe fs = let f a x = a x in let base = [] in List.fold_left f base fs;;



let pipe fs =
  let f a x f x f a = f a x in let base y = y in List.fold_left f base fs;;


(* changed spans
(2,45)-(2,47)
*)

(* type error slice
(2,51)-(2,75)
*)
