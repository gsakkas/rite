
let f a b a = a * b;;

let pipe fs =
  let f a x = f (x a) in let base x = x in List.fold_left f base fs;;



let pipe fs =
  let f a x b = x (a b) in let base x = x in List.fold_left f base fs;;


(* changed spans
(2,5)-(4,4)
(5,15)-(5,18)
*)

(* type error slice
(5,44)-(5,68)
*)
