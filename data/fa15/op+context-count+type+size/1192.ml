
let pipe fs =
  let f a x n = a + x in let base n = n in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x = (fun n  -> n) a in let base n = n in List.fold_left f base fs;;

*)

(* changed spans
(3,13)-(3,22)
(3,17)-(3,22)
(3,21)-(3,22)
(3,26)-(3,68)
*)

(* type error slice
(3,3)-(3,68)
(3,9)-(3,22)
(3,11)-(3,22)
(3,13)-(3,22)
(3,17)-(3,18)
(3,17)-(3,22)
(3,44)-(3,58)
(3,44)-(3,68)
(3,59)-(3,60)
*)
