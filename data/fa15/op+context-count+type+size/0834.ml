
let pipe fs =
  let f a x y = a x y in let base x' = x' in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x y = x (a y) in let base x' = x' in List.fold_left f base fs;;

*)

(* changed spans
(3,16)-(3,17)
(3,16)-(3,21)
(3,20)-(3,21)
(3,25)-(3,69)
*)

(* type error slice
(3,2)-(3,69)
(3,8)-(3,21)
(3,10)-(3,21)
(3,12)-(3,21)
(3,16)-(3,17)
(3,16)-(3,21)
(3,45)-(3,59)
(3,45)-(3,69)
(3,60)-(3,61)
*)
