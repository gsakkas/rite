
let sqsum xs =
  let f a x = a * a in
  let base = match xs with | hd::tl -> (f hd hd) + (f tl tl) in
  List.fold_left f base xs;;


(* fix

let sqsum xs =
  let f a x = a * a in
  let base = match xs with | hd::tl -> (f hd hd) + (f (f hd hd) tl) in
  List.fold_left f base xs;;

*)

(* changed spans
(3,15)-(3,16)
(3,19)-(3,20)
(4,55)-(4,57)
(4,58)-(4,60)
*)

(* type error slice
(3,3)-(5,27)
(3,9)-(3,20)
(3,11)-(3,20)
(3,15)-(3,16)
(3,15)-(3,20)
(4,14)-(4,60)
(4,53)-(4,54)
(4,53)-(4,60)
(4,55)-(4,57)
(4,58)-(4,60)
*)
