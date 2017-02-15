
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
(4,54)-(4,56)
(4,57)-(4,59)
*)

(* type error slice
(4,13)-(4,60)
(4,13)-(4,60)
(4,39)-(4,48)
(4,40)-(4,41)
(4,42)-(4,44)
(4,51)-(4,60)
(4,52)-(4,53)
(4,54)-(4,56)
*)
