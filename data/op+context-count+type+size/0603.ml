
let sqsum xs =
  let f a x = a + (x * x) in
  let base = match xs with | [] -> [] | hd::tl -> f 0 hd in
  List.fold_left f base xs;;



let sqsum xs =
  let f a x = a + (x * x) in
  let base = match xs with | [] -> 0 | hd::tl -> f 0 hd in
  List.fold_left f base xs;;


(* changed spans
(4,36)-(4,38)
*)

(* type error slice
(3,3)-(5,27)
(4,14)-(4,57)
(4,51)-(4,57)
*)
