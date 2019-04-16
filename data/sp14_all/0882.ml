
let pipe fs =
  let f a x = function | f' -> x (f' a) in
  let base = function | y -> y in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x = function | v -> x (a v) in
  let base = function | y -> y in List.fold_left f base fs;;

*)

(* changed spans
(3,15)-(3,40)
match $x with
| v -> x (a v)
CaseG VarG (fromList [(VarPatG,Nothing,AppG (fromList [EmptyG]))])

*)

(* type error slice
(3,3)-(4,59)
(3,9)-(3,40)
(3,11)-(3,40)
(3,15)-(3,40)
(3,34)-(3,40)
(3,35)-(3,37)
(3,38)-(3,39)
(4,35)-(4,49)
(4,35)-(4,59)
(4,50)-(4,51)
*)
