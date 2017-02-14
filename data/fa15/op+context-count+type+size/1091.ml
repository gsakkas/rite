
let pipe fs =
  let f a x = [x + a] in let base = [] in List.fold_left f base fs;;


(* fix

let pipe fs = let f a x b = x b in let base b = b in List.fold_left f base fs;;

*)

(* changed spans
(3,3)-(3,67)
(3,15)-(3,22)
(3,16)-(3,17)
(3,16)-(3,21)
(3,20)-(3,21)
(3,26)-(3,67)
(3,37)-(3,39)
(3,43)-(3,67)
*)

(* type error slice
(3,3)-(3,67)
(3,9)-(3,22)
(3,11)-(3,22)
(3,15)-(3,22)
(3,16)-(3,21)
(3,20)-(3,21)
(3,43)-(3,57)
(3,43)-(3,67)
(3,58)-(3,59)
*)
