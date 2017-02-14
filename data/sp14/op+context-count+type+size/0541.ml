
let sqsum xs =
  let f a x = a + (x * x) in let base = f 4 xs in List.fold_left f base xs;;


(* fix

let sqsum xs =
  let f a x = a * a in let base = f (f 0 xs) xs in List.fold_left f base xs;;

*)

(* changed spans
(3,15)-(3,16)
(3,15)-(3,25)
(3,20)-(3,21)
(3,24)-(3,25)
(3,30)-(3,75)
(3,41)-(3,47)
(3,43)-(3,44)
(3,45)-(3,47)
(3,51)-(3,75)
*)

(* type error slice
(3,3)-(3,75)
(3,9)-(3,25)
(3,11)-(3,25)
(3,20)-(3,21)
(3,20)-(3,25)
(3,41)-(3,42)
(3,41)-(3,47)
(3,45)-(3,47)
(3,51)-(3,65)
(3,51)-(3,75)
(3,73)-(3,75)
*)
