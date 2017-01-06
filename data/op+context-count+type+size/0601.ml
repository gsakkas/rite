
let sqsum xs =
  let f a x = a * a in
  let base = match xs with | hd::tl -> (f hd hd) + (f tl tl) in
  List.fold_left f base xs;;



let sqsum xs =
  let f a x = a * a in
  let base = match xs with | hd::tl -> (f hd hd) + (f (f hd hd) tl) in
  List.fold_left f base xs;;


(* changed spans
(4,55)-(4,57)
*)

(* type error slice
(3,3)-(5,27)
(4,53)-(4,60)
*)
