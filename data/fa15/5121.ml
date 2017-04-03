
let sqsum xs = let f a x = x * x in let base = 0 in List.fold_right f base xs;;


(* fix

let sqsum xs =
  let f a x = a + (x * x) in let base = 0 in List.fold_left f base xs;;

*)

(* changed spans
(2,27)-(2,32)
(2,52)-(2,67)
*)

(* type error slice
(2,36)-(2,77)
(2,47)-(2,48)
(2,52)-(2,67)
(2,52)-(2,77)
(2,70)-(2,74)
*)

(* all spans
(2,10)-(2,77)
(2,15)-(2,77)
(2,21)-(2,32)
(2,23)-(2,32)
(2,27)-(2,32)
(2,27)-(2,28)
(2,31)-(2,32)
(2,36)-(2,77)
(2,47)-(2,48)
(2,52)-(2,77)
(2,52)-(2,67)
(2,68)-(2,69)
(2,70)-(2,74)
(2,75)-(2,77)
*)
