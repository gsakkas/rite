
let sqsum xs =
  let f a x = match xs with | [] -> a | hd::tl -> a + (x * x) in
  let base = f 0 xs in List.fold_left f base xs;;


(* fix

let sqsum xs =
  let f a x = a + (x * x) in
  let base = match xs with | [] -> 0 | hd::tl -> f 0 hd in
  List.fold_left f base xs;;

*)

(* changed spans
(4,13)-(4,19)
xs
VarG

(4,13)-(4,19)
0
LitG

(4,13)-(4,19)
match xs with
| [] -> 0
| hd :: tl -> f 0 hd
CaseG VarG (fromList [(Nothing,AppG (fromList [EmptyG])),(Nothing,LitG)])

(4,17)-(4,19)
hd
VarG

*)
