
let padZero l1 l2 =
  if (List.length l1) = (List.length l2)
  then (l1, l2)
  else if (List.length l1) < (List.length l2) then 0 :: l1;;


(* fix

let padZero l1 l2 =
  if (List.length l1) = (List.length l2)
  then (l1, l2)
  else if (List.length l1) < (List.length l2) then (l1, l2) else (l1, l2);;

*)

(* changed spans
(5,52)-(5,59)
(l1 , l2)
TupleG (fromList [VarG])

(5,59)-(5,59)
(l1 , l2)
TupleG (fromList [VarG])

*)

(* type error slice
(5,8)-(5,59)
(5,52)-(5,59)
(5,59)-(5,59)
*)
