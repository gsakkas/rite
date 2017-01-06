
let sqsum xs =
  let f a x = a + (x * x) in
  let base = match xs with | [] -> f 0 [] | hd::tl -> f 0 hd in
  List.fold_left f base xs;;



let sqsum xs =
  let f a x = a + (x * x) in
  let base = match xs with | [] -> f 0 0 | hd::tl -> f 0 hd in
  List.fold_left f base xs;;


(* changed spans
(4,40)-(4,42)
*)

(* type error slice
(3,3)-(5,27)
(4,36)-(4,42)
*)
