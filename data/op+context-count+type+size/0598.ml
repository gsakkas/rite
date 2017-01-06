
let sqsum xs =
  let rec f a x = match xs with | [] -> a | hd::tl -> f (f a hd) tl in
  let base = 0 in List.fold_left f base xs;;



let sqsum xs =
  let f a x = a * a in
  let base = match xs with | [] -> 4 | hd::tl -> f (f 2 hd) tl in
  List.fold_left f base xs;;


(* changed spans
(3,7)-(3,10)
(3,41)-(3,42)
(3,60)-(3,61)
(4,3)-(4,18)
*)

(* type error slice
(3,55)-(3,68)
(3,58)-(3,64)
*)
