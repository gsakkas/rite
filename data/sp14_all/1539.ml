
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
(4,55)-(4,57)
f hd hd
AppG (fromList [VarG])

*)

(* type error slice
(4,14)-(4,61)
(4,40)-(4,49)
(4,41)-(4,42)
(4,43)-(4,45)
(4,52)-(4,61)
(4,53)-(4,54)
(4,55)-(4,57)
*)
