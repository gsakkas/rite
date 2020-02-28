
let sqsum xs =
  let f a x = a + (x * x) in
  let base = match xs with | [] -> [] | hd::tl -> f 0 hd in
  List.fold_left f base xs;;


(* fix

let sqsum xs =
  let f a x = a + (x * x) in
  let base = match xs with | [] -> 0 | hd::tl -> f 0 hd in
  List.fold_left f base xs;;

*)

(* changed spans
(4,36)-(4,38)
0
LitG

*)

(* type error slice
(3,3)-(5,27)
(3,9)-(3,26)
(3,11)-(3,26)
(3,15)-(3,16)
(3,15)-(3,26)
(4,3)-(5,27)
(4,14)-(4,57)
(4,36)-(4,38)
(4,51)-(4,52)
(4,51)-(4,57)
(5,3)-(5,17)
(5,3)-(5,27)
(5,18)-(5,19)
(5,20)-(5,24)
*)
