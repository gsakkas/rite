
let sqsum xs = let f a x = a * a in let base = f in List.fold_left f base xs;;


(* fix

let sqsum xs =
  let f a x = a + x in let base = List.hd xs in List.fold_left f base xs;;

*)

(* changed spans
(2,16)-(2,77)
(2,28)-(2,29)
(2,28)-(2,33)
(2,37)-(2,77)
(2,48)-(2,49)
(2,53)-(2,77)
*)

(* type error slice
(2,37)-(2,77)
(2,48)-(2,49)
(2,53)-(2,67)
(2,53)-(2,77)
(2,68)-(2,69)
(2,70)-(2,74)
*)
