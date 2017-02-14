
let sqsum xs =
  let f a x = match x with | [] -> a | x::t -> x * x in
  let base = [] in List.fold_left f base xs;;


(* fix

let sqsum xs =
  let f a x = match x with | 0 -> a | x -> x * x in
  let base = 0 in List.fold_left f base xs;;

*)

(* changed spans
(3,14)-(3,52)
(4,13)-(4,15)
*)

(* type error slice
(3,2)-(4,43)
(3,8)-(3,52)
(3,14)-(3,52)
(3,14)-(3,52)
(3,35)-(3,36)
(3,47)-(3,52)
(4,2)-(4,43)
(4,13)-(4,15)
(4,19)-(4,33)
(4,19)-(4,43)
(4,34)-(4,35)
(4,36)-(4,40)
*)
