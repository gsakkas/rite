
let pipe fs n =
  let f a x = a + (n x) in let base = n in List.fold_left f base fs;;


(* fix

let pipe fs = let f a x = a in let base fs = fs in List.fold_left f base fs;;

*)

(* changed spans
(2,13)-(3,68)
(3,3)-(3,68)
(3,15)-(3,23)
(3,20)-(3,21)
(3,20)-(3,23)
(3,22)-(3,23)
(3,28)-(3,68)
(3,39)-(3,40)
(3,44)-(3,68)
*)

(* type error slice
(3,3)-(3,68)
(3,9)-(3,23)
(3,15)-(3,16)
(3,15)-(3,23)
(3,20)-(3,21)
(3,20)-(3,23)
(3,28)-(3,68)
(3,39)-(3,40)
(3,44)-(3,58)
(3,44)-(3,68)
(3,59)-(3,60)
(3,61)-(3,65)
*)
