
let sqsum xs =
  let f a x = a + (x * x) in
  let base = match xs with | [] -> f 0 [] | hd::tl -> f 0 hd in
  List.fold_left f base xs;;


(* fix

let sqsum xs =
  let f a x = a + (x * x) in
  let base = match xs with | [] -> f 0 0 | hd::tl -> f 0 hd in
  List.fold_left f base xs;;

*)

(* changed spans
(4,39)-(4,41)
0
LitG

*)
