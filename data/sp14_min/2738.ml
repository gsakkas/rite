
let pipe fs =
  let f a x = a x in
  let base = failwith "to be implemented" in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x = function | g -> g in
  let base = function | x -> x in List.fold_left f base fs;;

*)

(* changed spans
(3,15)-(3,18)
function | g -> g
LamG VarPatG (CaseG EmptyG [(EmptyPatG,Nothing,EmptyG)])

(4,14)-(4,42)
function | x -> x
LamG VarPatG (CaseG EmptyG [(EmptyPatG,Nothing,EmptyG)])

*)

(* type error slice
(3,3)-(4,70)
(3,9)-(3,18)
(3,11)-(3,18)
(3,15)-(3,16)
(3,15)-(3,18)
(4,46)-(4,60)
(4,46)-(4,70)
(4,61)-(4,62)
*)
