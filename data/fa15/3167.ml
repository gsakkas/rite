
let pipe fs =
  let f a x g x = x a in let base g x = x in List.fold_left f base fs;;


(* fix

let pipe fs = let f a x = a in let base g x = x in List.fold_left f base fs;;

*)

(* changed spans
(3,12)-(3,21)
(3,14)-(3,21)
(3,18)-(3,19)
(3,18)-(3,21)
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

(* all spans
(2,9)-(3,69)
(3,2)-(3,69)
(3,8)-(3,21)
(3,10)-(3,21)
(3,12)-(3,21)
(3,14)-(3,21)
(3,18)-(3,21)
(3,18)-(3,19)
(3,20)-(3,21)
(3,25)-(3,69)
(3,34)-(3,41)
(3,36)-(3,41)
(3,40)-(3,41)
(3,45)-(3,69)
(3,45)-(3,59)
(3,60)-(3,61)
(3,62)-(3,66)
(3,67)-(3,69)
*)
