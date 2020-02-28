
let f a x = a * a;;

let sqsum xs =
  let f a x = (a * a) + (f List.hd xs x) in
  let base = 0 in List.fold_left f base xs;;


(* fix

let sqsum xs =
  let f a x = (a * a) + x in let base = 0 in List.fold_left f base xs;;

*)

(* changed spans
(5,25)-(5,41)
x
VarG

*)

(* type error slice
(2,4)-(2,20)
(2,7)-(2,18)
(2,13)-(2,14)
(2,13)-(2,18)
(5,25)-(5,41)
(5,26)-(5,27)
(5,28)-(5,35)
*)
