
let pipe fs = let f a x = fs + x in let base = [] in List.fold_left f base fs;;


(* fix

let pipe fs = let f a x b = x b in let base b = b in List.fold_left f base fs;;

*)

(* changed spans
(2,26)-(2,28)
(2,26)-(2,32)
(2,31)-(2,32)
(2,36)-(2,77)
(2,47)-(2,49)
(2,53)-(2,77)
*)

(* type error slice
(2,14)-(2,77)
(2,20)-(2,32)
(2,22)-(2,32)
(2,26)-(2,32)
(2,36)-(2,77)
(2,47)-(2,49)
(2,53)-(2,67)
(2,53)-(2,77)
(2,68)-(2,69)
(2,70)-(2,74)
*)
