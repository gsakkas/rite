
let pipe fs =
  let f a x h x = x a in let base g x = x in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x x = a x in let base g x = x in List.fold_left f base fs;;

*)

(* changed spans
(3,12)-(3,21)
(3,18)-(3,19)
(3,25)-(3,69)
(3,34)-(3,41)
*)

(* type error slice
(3,2)-(3,69)
(3,8)-(3,21)
(3,10)-(3,21)
(3,12)-(3,21)
(3,14)-(3,21)
(3,18)-(3,19)
(3,18)-(3,21)
(3,20)-(3,21)
(3,45)-(3,59)
(3,45)-(3,69)
(3,60)-(3,61)
*)
