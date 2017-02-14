
let pipe fs =
  let f a x = a = (fun y  -> x (a y)) in
  let base x = x in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x y = x (a y) in let base x = x in List.fold_left f base fs;;

*)

(* changed spans
(3,14)-(3,15)
(3,14)-(3,37)
(4,2)-(4,44)
*)

(* type error slice
(3,2)-(4,44)
(3,8)-(3,37)
(3,10)-(3,37)
(3,14)-(3,37)
(3,31)-(3,36)
(3,32)-(3,33)
(4,20)-(4,34)
(4,20)-(4,44)
(4,35)-(4,36)
*)
