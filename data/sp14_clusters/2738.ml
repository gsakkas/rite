
let pipe fs =
  let f a x = a x in
  let base = failwith "to be implemented" in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x = function | g -> g in
  let base = function | x -> x in List.fold_left f base fs;;

*)

(* changed spans
(3,16)-(3,17)
function | g -> g
LamG (CaseG EmptyG [(Nothing,EmptyG)])

(4,2)-(4,69)
$x
VarG

(4,2)-(4,69)
g
VarG

(4,2)-(4,69)
match $x with
| g -> g
CaseG VarG [(Nothing,VarG)]

(4,22)-(4,41)
function | x -> x
LamG (CaseG EmptyG [(Nothing,EmptyG)])

(4,45)-(4,69)
$x
VarG

(4,45)-(4,69)
x
VarG

(4,45)-(4,69)
match $x with
| x -> x
CaseG VarG [(Nothing,VarG)]

*)
