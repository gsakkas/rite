
let sqsum xs =
  let f a x = a + (x * x) in let base = f 4 xs in List.fold_left f base xs;;



let sqsum xs =
  let f a x = a * a in let base = f (f 0 xs) xs in List.fold_left f base xs;;


(* changed spans
(3,17)-(3,21)
(3,24)-(3,26)
(3,43)-(3,44)
*)

(* type error slice
(3,51)-(3,75)
*)
