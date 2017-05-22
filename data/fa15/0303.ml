
let pipe fs =
  let f a x = a + (fs a) in let base = 0 in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x = (fun n  -> n) a in let base n = n in List.fold_left f base fs;;

*)

(* changed spans
(3,14)-(3,15)
(3,14)-(3,24)
(3,19)-(3,21)
(3,22)-(3,23)
(3,39)-(3,40)
(3,44)-(3,68)
*)

(* type error slice
(3,18)-(3,24)
(3,19)-(3,21)
(3,44)-(3,58)
(3,44)-(3,68)
(3,66)-(3,68)
*)

(* all spans
(2,9)-(3,68)
(3,2)-(3,68)
(3,8)-(3,24)
(3,10)-(3,24)
(3,14)-(3,24)
(3,14)-(3,15)
(3,18)-(3,24)
(3,19)-(3,21)
(3,22)-(3,23)
(3,28)-(3,68)
(3,39)-(3,40)
(3,44)-(3,68)
(3,44)-(3,58)
(3,59)-(3,60)
(3,61)-(3,65)
(3,66)-(3,68)
*)
