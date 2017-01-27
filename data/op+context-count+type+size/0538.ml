
let sqsum xs =
  let f a x = match x with | hd::tl -> hd * hd in
  let base = f 4 xs in List.fold_left f base xs;;


(* fix

let sqsum xs =
  let f a x = a * a in let base = f 4 xs in List.fold_left f base xs;;

*)

(* changed spans
(3,15)-(3,47)
(3,21)-(3,22)
(3,40)-(3,42)
(3,45)-(3,47)
(4,3)-(4,48)
*)

(* type error slice
(3,3)-(4,48)
(3,9)-(3,47)
(3,11)-(3,47)
(3,15)-(3,47)
(3,21)-(3,22)
(3,40)-(3,47)
(4,3)-(4,48)
(4,14)-(4,15)
(4,14)-(4,20)
(4,16)-(4,17)
(4,18)-(4,20)
(4,24)-(4,38)
(4,24)-(4,48)
(4,39)-(4,40)
(4,41)-(4,45)
(4,46)-(4,48)
*)
