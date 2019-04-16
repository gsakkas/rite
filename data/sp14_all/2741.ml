
let pipe fs =
  let f a x = a x in
  let base = match fs with | 0 -> 0 | _ -> fs in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x = function | g -> g in
  let base = function | x -> x in List.fold_left f base fs;;

*)

(* changed spans
(3,15)-(3,18)
function | g -> g
LamG VarPatG (CaseG EmptyG (fromList [(VarPatG,Nothing,EmptyG)]))

(4,14)-(4,46)
function | x -> x
LamG VarPatG (CaseG EmptyG (fromList [(VarPatG,Nothing,EmptyG)]))

*)

(* type error slice
(3,3)-(4,74)
(3,9)-(3,18)
(3,11)-(3,18)
(3,15)-(3,16)
(3,15)-(3,18)
(4,50)-(4,64)
(4,50)-(4,74)
(4,65)-(4,66)
*)
