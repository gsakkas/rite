
let sqsum xs =
  let f a x a x = a + (x * x) in
  let base base = base in List.fold_left f base xs;;


(* fix

let sqsum xs =
  let f a x a x = a + x in
  let base = 0 in List.fold_left (fun a  -> fun x  -> a + (x * x)) 0 xs;;

*)

(* changed spans
(3,24)-(3,29)
(3,28)-(3,29)
(4,12)-(4,23)
(4,19)-(4,23)
(4,42)-(4,43)
(4,44)-(4,48)
(4,49)-(4,51)
*)

(* type error slice
(3,3)-(4,51)
(3,9)-(3,29)
(3,11)-(3,29)
(3,13)-(3,29)
(3,15)-(3,29)
(3,19)-(3,20)
(3,19)-(3,29)
(4,3)-(4,51)
(4,12)-(4,23)
(4,19)-(4,23)
(4,27)-(4,41)
(4,27)-(4,51)
(4,42)-(4,43)
(4,44)-(4,48)
*)
