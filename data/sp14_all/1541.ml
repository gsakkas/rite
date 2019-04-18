
let sqsum xs =
  let f a x = match x with | [] -> a | hd::tl -> a + (hd * hd) in
  let base = f 0 xs in List.fold_left f base xs;;


(* fix

let sqsum xs =
  let f a x = a + (x * x) in
  let base = match xs with | [] -> 0 | hd::tl -> f 0 hd in
  List.fold_left f base xs;;

*)

(* changed spans
(3,15)-(3,63)
a + (x * x)
BopG VarG (BopG EmptyG EmptyG)

(4,14)-(4,20)
match xs with
| [] -> 0
| hd :: tl -> f 0 hd
CaseG (fromList [(ConsPatG VarPatG VarPatG,Nothing,AppG (fromList [EmptyG])),(ConPatG Nothing,Nothing,LitG)])

*)

(* type error slice
(4,14)-(4,15)
(4,14)-(4,20)
(4,18)-(4,20)
(4,24)-(4,38)
(4,24)-(4,48)
(4,39)-(4,40)
(4,46)-(4,48)
*)
