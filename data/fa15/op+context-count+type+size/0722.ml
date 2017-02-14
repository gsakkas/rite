
let sqsum xs =
  let f a x = match x with | [] -> 0 | h::t -> 1 in
  let base = List.hd xs in List.fold_left f base xs;;


(* fix

let sqsum xs =
  let f a x = (a * a) + (x * x) in
  let base = List.hd xs in List.fold_left f base xs;;

*)

(* changed spans
(3,14)-(3,48)
(3,20)-(3,21)
(3,35)-(3,36)
(3,47)-(3,48)
*)

(* type error slice
(3,2)-(4,51)
(3,8)-(3,48)
(3,10)-(3,48)
(3,14)-(3,48)
(3,14)-(3,48)
(3,14)-(3,48)
(3,20)-(3,21)
(3,35)-(3,36)
(4,2)-(4,51)
(4,13)-(4,20)
(4,13)-(4,23)
(4,21)-(4,23)
(4,27)-(4,41)
(4,27)-(4,51)
(4,42)-(4,43)
(4,44)-(4,48)
(4,49)-(4,51)
*)
