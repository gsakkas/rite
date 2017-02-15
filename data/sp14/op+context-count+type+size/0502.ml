
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
(4,39)-(4,41)
*)

(* type error slice
(3,2)-(5,26)
(3,8)-(3,25)
(3,10)-(3,25)
(3,18)-(3,25)
(3,19)-(3,20)
(4,35)-(4,36)
(4,35)-(4,41)
(4,39)-(4,41)
*)
