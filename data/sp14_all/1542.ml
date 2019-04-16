
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
(3,15)-(3,62)
a + (x * x)
BopG VarG (BopG EmptyG EmptyG)

(4,14)-(4,20)
match xs with
| [] -> 0
| hd :: tl -> f 0 hd
CaseG VarG (fromList [(ConsPatG VarPatG VarPatG,Nothing,AppG (fromList [EmptyG])),(ConPatG Nothing,Nothing,LitG)])

*)

(* type error slice
(3,3)-(4,48)
(3,9)-(3,62)
(3,11)-(3,62)
(3,15)-(3,62)
(3,21)-(3,23)
(3,55)-(3,62)
(3,56)-(3,57)
(4,14)-(4,15)
(4,14)-(4,20)
(4,18)-(4,20)
*)
