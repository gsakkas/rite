
let sqsum xs =
  let f a x = match x with | [] -> a | hd::tl -> a + (hd * hd) in
  let base = f 0 xs in List.fold_left f base xs;;



let sqsum xs =
  let f a x = a + (x * x) in
  let base = match xs with | [] -> 0 | hd::tl -> f 0 hd in
  List.fold_left f base xs;;


(* changed spans
(3,15)-(3,20)
(3,36)-(3,37)
(3,50)-(4,13)
(4,18)-(4,20)
*)

(* type error slice
(4,24)-(4,48)
*)
