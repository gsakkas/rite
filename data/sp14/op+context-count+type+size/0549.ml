
let sqsum xs =
  let f a x = match x with | [] -> a | hd::tl -> a + (hd * hd) in
  let base = f 0 xs in List.fold_left f base xs;;


(* fix

let sqsum xs =
  let f a x = a + (x * x) in
  let base = match xs with | [] -> 0 | hd::tl -> f 0 hd in
  List.fold_left f base xs;;

*)

(* changed spans
(3,15)-(3,62)
(3,21)-(3,22)
(3,36)-(3,37)
(3,55)-(3,57)
(3,60)-(3,62)
(4,3)-(4,48)
(4,14)-(4,20)
(4,18)-(4,20)
*)

(* type error slice
(4,14)-(4,15)
(4,14)-(4,20)
(4,18)-(4,20)
(4,24)-(4,38)
(4,24)-(4,48)
(4,39)-(4,40)
(4,46)-(4,48)
*)
