
let padZero l1 l2 =
  let difference1 = (List.length l1) - (List.length l2) in
  let difference2 = (List.length l2) - (List.length l1) in
  let retTuple = (l1, l2) in
  if difference1 > 0 then (l1, l2) else if difference2 > 0 then (l1, l2);;


(* fix

let padZero l1 l2 =
  let difference1 = (List.length l1) - (List.length l2) in
  let difference2 = (List.length l2) - (List.length l1) in
  let retTuple = (l1, l2) in
  if difference1 > 0
  then (l1, l2)
  else if difference2 > 0 then (l1, l2) else (l1, l2);;

*)

(* changed spans
(6,73)-(6,73)
(l1 , l2)
TupleG [VarG,VarG]

*)

(* type error slice
(6,41)-(6,73)
(6,65)-(6,73)
(6,73)-(6,73)
*)
