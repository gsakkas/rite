
let pipe fs = let f a x = a x in let base = fs in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x = function | g -> g in
  let base = function | x -> x in List.fold_left f base fs;;

*)

(* changed spans
(2,28)-(2,29)
function | g -> g
LamG (CaseG EmptyG [(Nothing,EmptyG)])

(2,33)-(2,74)
$x
VarG

(2,33)-(2,74)
g
VarG

(2,33)-(2,74)
match $x with
| g -> g
CaseG VarG [(Nothing,VarG)]

(2,44)-(2,46)
function | x -> x
LamG (CaseG EmptyG [(Nothing,EmptyG)])

(2,50)-(2,74)
$x
VarG

(2,50)-(2,74)
x
VarG

(2,50)-(2,74)
match $x with
| x -> x
CaseG VarG [(Nothing,VarG)]

*)
