
let pipe fs =
  let f a x = (x fs) + a in let base = 0 in List.fold_left f base fs;;


(* fix

let pipe fs = let f a x = x in let base x = x in List.fold_left f base fs;;

*)

(* changed spans
(3,3)-(3,69)
(3,16)-(3,20)
(3,16)-(3,25)
(3,18)-(3,20)
(3,24)-(3,25)
(3,29)-(3,69)
(3,40)-(3,41)
(3,45)-(3,69)
*)

(* type error slice
(3,3)-(3,69)
(3,9)-(3,25)
(3,11)-(3,25)
(3,16)-(3,17)
(3,16)-(3,20)
(3,18)-(3,20)
(3,45)-(3,59)
(3,45)-(3,69)
(3,60)-(3,61)
(3,67)-(3,69)
*)
