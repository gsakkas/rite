
let pipe fs = let f a x = a x in let base = 0 in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x = function | g -> g in
  let base = function | x -> x in List.fold_left f base fs;;

*)

(* changed spans
(2,28)-(2,29)
function | g -> g
LamG (CaseG EmptyG (fromList [(Nothing,EmptyG)]))

(2,33)-(2,73)
$x
VarG

(2,33)-(2,73)
g
VarG

(2,33)-(2,73)
match $x with
| g -> g
CaseG VarG (fromList [(Nothing,VarG)])

(2,44)-(2,45)
function | x -> x
LamG (CaseG EmptyG (fromList [(Nothing,EmptyG)]))

(2,49)-(2,73)
$x
VarG

(2,49)-(2,73)
x
VarG

(2,49)-(2,73)
match $x with
| x -> x
CaseG VarG (fromList [(Nothing,VarG)])

*)
