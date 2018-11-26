
let sqsum xs =
  let f a x = a * a in let base = f xs xs in List.fold_left f base xs;;


(* fix

let sqsum xs =
  let f a x = a * a in let base = f 8 xs in List.fold_left f base xs;;

*)

(* changed spans
(3,36)-(3,38)
8
LitG

*)
