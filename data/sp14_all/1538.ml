
let sqsum xs =
  let f a x = a * a in
  let base = match xs with | [] -> xs | hd::tl -> f (f hd hd) tl in
  List.fold_left f base xs;;


(* fix

let sqsum xs =
  let f a x = a * a in
  let base = match xs with | hd::tl -> f (f hd hd) tl in
  List.fold_left f base xs;;

*)

(* changed spans
(4,19)-(4,21)
match xs with
| hd :: tl -> f (f hd hd) tl
CaseG VarG (fromList [(Nothing,AppG (fromList [EmptyG]))])

*)
