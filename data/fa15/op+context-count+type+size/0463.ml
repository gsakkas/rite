
let sqsum xs =
  let f a x x = (x * x) + a in let base = [] in List.fold_left f base xs;;


(* fix

let sqsum xs =
  let f a x = (x * x) + a in let base = 0 in List.fold_left f base xs;;

*)

(* changed spans
(3,12)-(3,27)
(3,31)-(3,72)
(3,42)-(3,44)
(3,48)-(3,72)
*)

(* type error slice
(3,2)-(3,72)
(3,8)-(3,27)
(3,10)-(3,27)
(3,12)-(3,27)
(3,16)-(3,27)
(3,26)-(3,27)
(3,48)-(3,62)
(3,48)-(3,72)
(3,63)-(3,64)
*)
