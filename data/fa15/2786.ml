
let x l = List.map string_of_int;;

let pipe fs = let f a x = a x in let base = x in List.fold_left f base fs;;


(* fix

let x l = List.map string_of_int;;

let pipe fs = let f a x = a in let base = x in List.fold_left f base fs;;

*)

(* changed spans
(4,26)-(4,29)
(4,28)-(4,29)
*)

(* type error slice
(4,14)-(4,73)
(4,20)-(4,29)
(4,22)-(4,29)
(4,26)-(4,27)
(4,26)-(4,29)
(4,49)-(4,63)
(4,49)-(4,73)
(4,64)-(4,65)
*)

(* all spans
(2,6)-(2,32)
(2,10)-(2,32)
(2,10)-(2,18)
(2,19)-(2,32)
(4,9)-(4,73)
(4,14)-(4,73)
(4,20)-(4,29)
(4,22)-(4,29)
(4,26)-(4,29)
(4,26)-(4,27)
(4,28)-(4,29)
(4,33)-(4,73)
(4,44)-(4,45)
(4,49)-(4,73)
(4,49)-(4,63)
(4,64)-(4,65)
(4,66)-(4,70)
(4,71)-(4,73)
*)
