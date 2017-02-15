
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
(3,2)-(4,42)
(3,18)-(3,67)
(3,40)-(3,41)
(3,59)-(3,60)
(4,2)-(4,42)
(4,13)-(4,14)
*)

(* type error slice
(3,18)-(3,67)
(3,18)-(3,67)
(3,54)-(3,55)
(3,54)-(3,67)
(3,56)-(3,64)
(3,57)-(3,58)
(3,61)-(3,63)
(3,65)-(3,67)
*)
