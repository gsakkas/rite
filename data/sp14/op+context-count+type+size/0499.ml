
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
(4,35)-(4,37)
*)

(* type error slice
(3,2)-(5,26)
(3,8)-(3,25)
(3,10)-(3,25)
(3,14)-(3,15)
(3,14)-(3,25)
(3,14)-(3,25)
(4,2)-(5,26)
(4,13)-(4,56)
(4,13)-(4,56)
(4,35)-(4,37)
(4,50)-(4,51)
(4,50)-(4,56)
(5,2)-(5,16)
(5,2)-(5,26)
(5,17)-(5,18)
(5,19)-(5,23)
*)
