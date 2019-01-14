
let pipe fs =
  let f a x = a x in
  let base = match fs with | 0 -> 0 | _ -> fs in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x = function | g -> g in
  let base = function | x -> x in List.fold_left f base fs;;

*)

(* changed spans
(3,16)-(3,17)
function | g -> g
LamG (CaseG EmptyG (fromList [(Nothing,EmptyG)]))

(4,2)-(4,73)
$x
VarG

(4,2)-(4,73)
g
VarG

(4,2)-(4,73)
match $x with
| g -> g
CaseG VarG (fromList [(Nothing,VarG)])

(4,43)-(4,45)
function | x -> x
LamG (CaseG EmptyG (fromList [(Nothing,EmptyG)]))

(4,49)-(4,73)
$x
VarG

(4,49)-(4,73)
x
VarG

(4,49)-(4,73)
match $x with
| x -> x
CaseG VarG (fromList [(Nothing,VarG)])

*)
