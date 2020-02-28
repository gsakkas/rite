
let padZero l1 l2 = if (List.length l1) = (List.length l2) then (l1, l2);;


(* fix

let padZero l1 l2 =
  if (List.length l1) = (List.length l2) then (l1, l2) else (l1, l2);;

*)

(* changed spans
(2,73)-(2,73)
(l1 , l2)
TupleG [VarG,VarG]

*)

(* type error slice
(2,21)-(2,73)
(2,65)-(2,73)
(2,73)-(2,73)
*)
