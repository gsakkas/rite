
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
(6,15)-(6,28)
a * a
BopG VarG VarG

*)

(* type error slice
(3,3)-(3,61)
(3,9)-(3,10)
(3,36)-(3,61)
(3,46)-(3,61)
(3,47)-(3,53)
(3,54)-(3,60)
(3,58)-(3,59)
(6,3)-(7,52)
(6,9)-(6,28)
(6,11)-(6,28)
(6,15)-(6,21)
(6,15)-(6,28)
(6,22)-(6,28)
(6,26)-(6,27)
(7,3)-(7,52)
(7,14)-(7,21)
(7,14)-(7,24)
(7,22)-(7,24)
(7,28)-(7,42)
(7,28)-(7,52)
(7,43)-(7,44)
(7,45)-(7,49)
(7,50)-(7,52)
*)
