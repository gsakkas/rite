
let pipe fs = let f a x = 0 in let base = fs in List.fold_left f base fs;;


(* fix

let pipe fs = let f a x = x in let base x = x in List.fold_left f base fs;;

*)

(* changed spans
(2,26)-(2,27)
(2,42)-(2,44)
(2,48)-(2,72)
*)

(* type error slice
(2,14)-(2,72)
(2,20)-(2,27)
(2,22)-(2,27)
(2,26)-(2,27)
(2,31)-(2,72)
(2,42)-(2,44)
(2,48)-(2,62)
(2,48)-(2,72)
(2,63)-(2,64)
(2,65)-(2,69)
(2,70)-(2,72)
*)
