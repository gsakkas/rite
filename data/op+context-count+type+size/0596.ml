
let sqsum xs =
  let f a x = a * a in let base = f xs xs in List.fold_left f base xs;;



let sqsum xs =
  let f a x = a * a in let base = f 8 xs in List.fold_left f base xs;;


(* changed spans
(3,37)-(3,39)
*)

(* type error slice
(3,46)-(3,70)
*)
