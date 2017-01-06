
let sqsum xs =
  let f a x = ((+) a) * a in let base = f 2 xs in List.fold_left f base xs;;



let sqsum xs =
  let f a x = a * a in let base = f 9 xs in List.fold_left f base xs;;


(* changed spans
(3,15)-(3,19)
(3,21)-(3,22)
(3,43)-(3,44)
*)

(* type error slice
*)
