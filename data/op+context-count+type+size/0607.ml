
let sqsum xs =
  let f a x = a + (x * x) in
  let base = match xs with | [] -> 0 | hd::tl -> f - (1 hd) in
  List.fold_left f base xs;;



let sqsum xs =
  let f a x = a + (x * x) in
  let base = match xs with | [] -> 0 | hd::tl -> f 0 hd in
  List.fold_left f base xs;;


(* changed spans
(4,52)-(4,56)
(4,59)-(4,60)
*)

(* type error slice
(4,55)-(4,59)
*)
