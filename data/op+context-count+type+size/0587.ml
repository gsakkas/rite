
let sqsum xs =
  let f a x = (+) in let base = 3 ** 2 in List.fold_left f base xs;;



let sqsum xs = let f a x = a in let base = f 2 xs in List.fold_left f base xs;;


(* changed spans
(3,15)-(3,18)
(3,33)-(3,37)
*)

(* type error slice
*)
