
let sqsum xs =
  let f a x = a + (x * x) in let base = f 4 xs in List.fold_left f base xs;;


(* fix

let sqsum xs =
  let f a x = a * a in let base = f (f 0 xs) xs in List.fold_left f base xs;;

*)

(* changed spans
(3,14)-(3,15)
(3,14)-(3,25)
(3,19)-(3,20)
(3,23)-(3,24)
(3,29)-(3,74)
(3,40)-(3,46)
(3,42)-(3,43)
(3,44)-(3,46)
(3,50)-(3,74)
*)

(* type error slice
(3,2)-(3,74)
(3,8)-(3,25)
(3,10)-(3,25)
(3,18)-(3,25)
(3,19)-(3,20)
(3,40)-(3,41)
(3,40)-(3,46)
(3,44)-(3,46)
(3,50)-(3,64)
(3,50)-(3,74)
(3,72)-(3,74)
*)
