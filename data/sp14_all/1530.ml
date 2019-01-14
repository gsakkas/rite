
let sqsum xs =
  let f a x = a * a in
  let base = match xs with | [] -> [] | x::xs' -> f x xs' in
  List.fold_left f base xs;;


(* fix

let sqsum xs =
  let f a x = a * a in let base = f 2 xs in List.fold_left f base xs;;

*)

(* changed spans
(4,54)-(4,57)
2
LitG

(5,2)-(5,26)
xs
VarG

*)
