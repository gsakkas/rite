
let pipe fs = let f a x = a x in let base = fs in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x = function | g -> g in
  let base = function | x -> x in List.fold_left f base fs;;

*)

(* changed spans
(2,27)-(2,30)
function | g -> g
LamG VarPatG (CaseG EmptyG [(EmptyPatG,Nothing,EmptyG)])

(2,45)-(2,47)
function | x -> x
LamG VarPatG (CaseG EmptyG [(EmptyPatG,Nothing,EmptyG)])

*)

(* type error slice
(2,15)-(2,75)
(2,21)-(2,30)
(2,23)-(2,30)
(2,27)-(2,28)
(2,27)-(2,30)
(2,51)-(2,65)
(2,51)-(2,75)
(2,66)-(2,67)
*)
