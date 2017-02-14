
let pipe fs =
  let f a x = a + (fs a) in let base = 0 in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x = (fun n  -> n) a in let base n = n in List.fold_left f base fs;;

*)

(* changed spans
(3,15)-(3,16)
(3,15)-(3,24)
(3,20)-(3,22)
(3,23)-(3,24)
(3,29)-(3,69)
(3,40)-(3,41)
(3,45)-(3,69)
*)

(* type error slice
(3,20)-(3,22)
(3,20)-(3,24)
(3,45)-(3,59)
(3,45)-(3,69)
(3,67)-(3,69)
*)
