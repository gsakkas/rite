
let sqsum xs =
  let f a x = a * a in
  let base = match xs with | [] -> [] | x::xs' -> f x xs' in
  List.fold_left f base xs;;


(* fix

let sqsum xs =
  let f a x = a * a in let base = f 2 xs in List.fold_left f base xs;;

*)

(* changed spans
(4,14)-(4,58)
f 2 xs
AppG [LitG,VarG]

*)

(* type error slice
(3,3)-(5,27)
(3,9)-(3,20)
(3,11)-(3,20)
(3,15)-(3,16)
(3,15)-(3,20)
(4,14)-(4,58)
(4,36)-(4,38)
(4,51)-(4,52)
(4,51)-(4,58)
(5,3)-(5,17)
(5,3)-(5,27)
(5,18)-(5,19)
*)
