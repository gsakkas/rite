
let pipe fs =
  let f a x = x a in
  let base = match fs with | (fn,n) -> n in List.fold_left f base fs;;


(* fix

let pipe fs =
  let piper fn n =
    let f a x = x a in let base = n in List.fold_left f base fs in
  piper fs;;

*)

(* changed spans
(3,2)-(4,68)
(4,13)-(4,40)
(4,19)-(4,21)
*)

(* type error slice
(4,13)-(4,40)
(4,19)-(4,21)
(4,44)-(4,58)
(4,44)-(4,68)
(4,66)-(4,68)
*)

(* all spans
(2,9)-(4,68)
(3,2)-(4,68)
(3,8)-(3,17)
(3,10)-(3,17)
(3,14)-(3,17)
(3,14)-(3,15)
(3,16)-(3,17)
(4,2)-(4,68)
(4,13)-(4,40)
(4,19)-(4,21)
(4,39)-(4,40)
(4,44)-(4,68)
(4,44)-(4,58)
(4,59)-(4,60)
(4,61)-(4,65)
(4,66)-(4,68)
*)
