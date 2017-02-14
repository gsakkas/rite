
let sqsum xs = let f a x = a * a in let base = [] in List.fold_left f base xs;;


(* fix

let sqsum xs =
  let f a x = a * a in let base = f 2 xs in List.fold_left f base xs;;

*)

(* changed spans
(2,15)-(2,77)
(2,36)-(2,77)
(2,47)-(2,49)
(2,53)-(2,77)
*)

(* type error slice
(2,15)-(2,77)
(2,21)-(2,32)
(2,27)-(2,28)
(2,27)-(2,32)
(2,36)-(2,77)
(2,47)-(2,49)
(2,53)-(2,67)
(2,53)-(2,77)
(2,68)-(2,69)
(2,70)-(2,74)
*)
