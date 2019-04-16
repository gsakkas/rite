
let sqsum xs =
  let f a x = match x with | [] -> 0 | x::xs' -> a * a in
  let base = List.hd xs in List.fold_left f base xs;;


(* fix

let sqsum xs =
  let f a x = (a * a) + (x * x) in
  let base = List.hd xs in List.fold_left f base xs;;

*)

(* changed spans
(3,15)-(3,55)
(a * a) + (x * x)
BopG (BopG EmptyG EmptyG) (BopG EmptyG EmptyG)

*)

(* type error slice
(3,3)-(4,52)
(3,9)-(3,55)
(3,11)-(3,55)
(3,15)-(3,55)
(3,21)-(3,22)
(3,50)-(3,51)
(3,50)-(3,55)
(4,3)-(4,52)
(4,14)-(4,21)
(4,14)-(4,24)
(4,22)-(4,24)
(4,28)-(4,42)
(4,28)-(4,52)
(4,43)-(4,44)
(4,45)-(4,49)
(4,50)-(4,52)
*)
