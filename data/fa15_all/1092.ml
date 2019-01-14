
let rec helper (a,x) =
  match x with | [] -> 0 | h::t -> (h * h) + (helper (a, x));;

let sqsum xs =
  let f a x = helper (a, x) in
  let base = List.hd xs in List.fold_left f base xs;;


(* fix

let sqsum xs =
  let f a x = a * a in let base = List.hd xs in List.fold_left f base xs;;

*)

(* changed spans
(6,21)-(6,27)
a * a
BopG VarG VarG

(6,25)-(6,26)
a
VarG

*)
