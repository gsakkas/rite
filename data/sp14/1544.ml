
let sqsum xs =
  let f a x = a + (x * x) in
  let base = match xs with | [] -> f 0 [] | hd::tl -> f 0 hd in
  List.fold_left f base xs;;


(* fix

let sqsum xs =
  let f a x = a + (x * x) in
  let base = match xs with | [] -> f 0 0 | hd::tl -> f 0 hd in
  List.fold_left f base xs;;

*)

(* changed spans
(4,40)-(4,42)
0
LitG

*)

(* type error slice
(3,3)-(5,27)
(3,9)-(3,26)
(3,11)-(3,26)
(3,19)-(3,26)
(3,20)-(3,21)
(4,36)-(4,37)
(4,36)-(4,42)
(4,40)-(4,42)
*)
