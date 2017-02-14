
let sqsum xs =
  let f a x = match x with | hd::tl -> hd * hd in
  let base = f 4 xs in List.fold_left f base xs;;


(* fix

let sqsum xs =
  let f a x = a * a in let base = f 4 xs in List.fold_left f base xs;;

*)

(* changed spans
(3,14)-(3,46)
(3,20)-(3,21)
(3,39)-(3,41)
(3,44)-(3,46)
(4,2)-(4,47)
(4,13)-(4,19)
*)

(* type error slice
(4,13)-(4,14)
(4,13)-(4,19)
(4,17)-(4,19)
(4,23)-(4,37)
(4,23)-(4,47)
(4,38)-(4,39)
(4,45)-(4,47)
*)
