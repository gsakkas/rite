
let sqsum xs =
  let rec f a x = match xs with | [] -> a | hd::tl -> f (f a hd) tl in
  let base = 0 in List.fold_left f base xs;;


(* fix

let sqsum xs =
  let f a x = a * a in
  let base = match xs with | [] -> 4 | hd::tl -> f (f 2 hd) tl in
  List.fold_left f base xs;;

*)

(* changed spans
(3,3)-(4,43)
(3,19)-(3,68)
(3,41)-(3,42)
(3,60)-(3,61)
(4,3)-(4,43)
(4,14)-(4,15)
*)

(* type error slice
(3,19)-(3,68)
(3,19)-(3,68)
(3,55)-(3,56)
(3,55)-(3,68)
(3,58)-(3,59)
(3,58)-(3,64)
(3,62)-(3,64)
(3,66)-(3,68)
*)
