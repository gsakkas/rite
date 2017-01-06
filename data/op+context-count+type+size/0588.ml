
let sqsum xs =
  let f a x = a ** 2 in let base = f 2 xs in List.fold_left f base xs;;



let sqsum xs = let f a x = a in let base = f 2 xs in List.fold_left f base xs;;


(* changed spans
(3,17)-(3,21)
*)

(* type error slice
(3,15)-(3,21)
*)
