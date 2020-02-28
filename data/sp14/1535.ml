
let sqsum xs =
  let f a x = a * a in let base = f xs xs in List.fold_left f base xs;;


(* fix

let sqsum xs =
  let f a x = a * a in let base = f 8 xs in List.fold_left f base xs;;

*)

(* changed spans
(3,37)-(3,39)
8
LitG

*)

(* type error slice
(3,3)-(3,70)
(3,9)-(3,20)
(3,15)-(3,16)
(3,15)-(3,20)
(3,35)-(3,36)
(3,35)-(3,42)
(3,37)-(3,39)
(3,46)-(3,60)
(3,46)-(3,70)
(3,68)-(3,70)
*)
