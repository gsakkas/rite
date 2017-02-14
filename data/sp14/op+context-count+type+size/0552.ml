
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
(4,49)-(4,59)
(4,53)-(4,59)
(4,54)-(4,55)
*)

(* type error slice
(3,2)-(5,26)
(3,8)-(3,25)
(4,49)-(4,50)
(4,49)-(4,59)
(4,53)-(4,59)
(4,54)-(4,55)
*)
