
let pipe fs =
  let f a x = function | _ -> x a in let base = 0 in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x = function | v -> x (a v) in
  let base = function | y -> y in List.fold_left f base fs;;

*)

(* changed spans
(3,14)-(3,33)
match $x with
| v -> x (a v)
CaseG VarG (fromList [(Nothing,AppG (fromList [EmptyG]))])

(3,32)-(3,33)
a v
AppG (fromList [VarG])

(3,37)-(3,77)
v
VarG

(3,48)-(3,49)
function | y -> y
LamG (CaseG EmptyG (fromList [(Nothing,EmptyG)]))

(3,53)-(3,77)
$x
VarG

(3,53)-(3,77)
y
VarG

(3,53)-(3,77)
match $x with
| y -> y
CaseG VarG (fromList [(Nothing,VarG)])

*)
