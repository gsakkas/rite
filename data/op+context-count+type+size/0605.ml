
let sqsum xs =
  let f a x = match xs with | [] -> a | hd::tl -> a + (x * x) in
  let base = f 0 xs in List.fold_left f base xs;;



let sqsum xs =
  let f a x = a + (x * x) in
  let base = match xs with | [] -> 0 | hd::tl -> f 0 hd in
  List.fold_left f base xs;;


(* changed spans
(3,37)-(3,38)
(3,51)-(4,13)
(4,18)-(4,20)
*)

(* type error slice
(3,3)-(4,48)
(4,14)-(4,20)
*)
