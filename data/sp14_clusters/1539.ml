
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
f hd hd
AppG [VarG,VarG]

(4,57)-(4,59)
f
VarG

(4,57)-(4,59)
hd
VarG

(4,57)-(4,59)
hd
VarG

*)
