
let sqsum xs =
  let f a x = x * x in let base = f 2 xs in List.fold_left f base xs;;



let sqsum xs = let f a x = a * a in let base = 0 in List.fold_left f base xs;;


(* changed spans
(3,15)-(3,16)
(3,19)-(3,20)
(3,35)-(3,41)
*)

(* type error slice
(3,45)-(3,69)
*)
