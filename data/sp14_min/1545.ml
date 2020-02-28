
let sqsum xs =
  let f a x = a + (x * x) in
  let base = match xs with | [] -> 0 | hd::tl -> f - (1 hd) in
  List.fold_left f base xs;;


(* fix

let sqsum xs =
  let f a x = a + (x * x) in
  let base = match xs with | [] -> 0 | hd::tl -> f 0 hd in
  List.fold_left f base xs;;

*)

(* changed spans
(4,50)-(4,60)
f 0 hd
AppG [LitG,VarG]

*)

(* type error slice
(3,3)-(5,27)
(3,9)-(3,26)
(4,50)-(4,51)
(4,50)-(4,60)
(4,54)-(4,60)
(4,55)-(4,56)
*)
