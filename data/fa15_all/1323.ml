
let sqsum xs =
  let f a x = match x with | [] -> a | x::t -> x * x in
  let base = [] in List.fold_left f base xs;;


(* fix

let sqsum xs =
  let f a x = match x with | 0 -> a | x -> x * x in
  let base = 0 in List.fold_left f base xs;;

*)

(* changed spans
(3,15)-(3,53)
match x with
| 0 -> a
| x -> x * x
CaseG (fromList [(VarPatG,Nothing,BopG EmptyG EmptyG),(LitPatG,Nothing,VarG)])

(4,14)-(4,16)
0
LitG

*)

(* type error slice
(3,3)-(4,44)
(3,9)-(3,53)
(3,15)-(3,53)
(3,36)-(3,37)
(3,48)-(3,53)
(4,3)-(4,44)
(4,14)-(4,16)
(4,20)-(4,34)
(4,20)-(4,44)
(4,35)-(4,36)
(4,37)-(4,41)
*)
