
let sqsum xs =
  let f a x = a * a in
  let base = match xs with | [] -> xs | hd::tl -> f (f hd hd) tl in
  List.fold_left f base xs;;



let sqsum xs =
  let f a x = a * a in
  let base = match xs with | hd::tl -> f (f hd hd) tl in
  List.fold_left f base xs;;


(* changed spans
(4,30)-(4,40)
*)

(* type error slice
(3,3)-(5,27)
(4,51)-(4,65)
*)
