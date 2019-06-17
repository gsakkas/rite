
let sqsum xs =
  let f a x = a * a in
  let base = match xs with | [] -> xs | hd::tl -> f (f hd hd) tl in
  List.fold_left f base xs;;


(* fix

let sqsum xs =
  let f a x = a * a in
  let base = match xs with | hd::tl -> f (f hd hd) tl in
  List.fold_left f base xs;;

*)

(* changed spans
(4,14)-(4,65)
match xs with
| hd :: tl -> f (f hd hd) tl
CaseG VarG [(ConsPatG EmptyPatG EmptyPatG,Nothing,AppG [EmptyG,EmptyG])]

(4,36)-(4,38)
f (f hd hd) tl
AppG [AppG [EmptyG,EmptyG],VarG]

*)

(* type error slice
(4,3)-(5,27)
(4,14)-(4,65)
(4,20)-(4,22)
(4,36)-(4,38)
(4,51)-(4,52)
(4,51)-(4,65)
(4,53)-(4,62)
(4,54)-(4,55)
(4,56)-(4,58)
(4,59)-(4,61)
(4,63)-(4,65)
(5,3)-(5,17)
(5,3)-(5,27)
(5,18)-(5,19)
(5,20)-(5,24)
*)
